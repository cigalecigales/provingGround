module NumVal
	ALPHABET_L = 27
	ALPHABET_S = 27
	MARKS = 9
end

module Char
	ALPHABET_L = [*'A'..'Z']
	ALPHABET_S = [*'a'..'z']
	MARKS = ["!", "?", ",", ".", " ", ";", "\"", "'"]
end

class ModeBase
	include NumVal
	include Char

	# 剰余計算に使う値を返す
	def get_numval
	end

	# 剰余に対応する文字を返す
	def get_char(val)
	end
end

class AlphabetLarge < ModeBase
	def get_numval
		NumVal::ALPHABET_L
	end

	def get_char(val)
		Char::ALPHABET_L[val - 1]
	end
end

class AlphabetSmall < ModeBase
	def get_numval
		NumVal::ALPHABET_S
	end

	def get_char(val)
		Char::ALPHABET_S[val - 1]
	end
end

class Marks < ModeBase
	def get_numval
		NumVal::MARKS
	end

	def get_char(val)
		Char::MARKS[val - 1]
	end
end

class DecodeMessage
	def initialize()
		@alphabet_l = AlphabetLarge.new
		@alphabet_s = AlphabetSmall.new
		@marks = Marks.new
	end

	def decode_message(code)
		code_array = code.split(",")
		decoded_message = ""
		mode = @alphabet_l

		code_array.length.times do |i|
			value = code_array[i].to_i % mode.get_numval
			if value != 0
				decoded_message << mode.get_char(value)
			else
				mode = check_mode(mode)
			end
		end

		decoded_message
	end

	private
	def check_mode(mode)
		case mode
		when @alphabet_l then @alphabet_s
		when @alphabet_s then @marks
		when @marks then @alphabet_l
		end
	end
end

decode_message = DecodeMessage.new
puts decode_message.decode_message("33,54,21,68,38,42,45,69,34,28,46,62,90,27,28,81,31,54,32,46,21")

class CharGroup
	def initialize(ary)
		@char_group = [*ary]
		@modulo = @char_group.length + 1
	end

	def get_char(remainder)
		@char_group[remainder - 1]
	end

	def get_modulo
		@modulo
	end
end


class DecodeMessage
	def initialize()
		@uppercase = CharGroup.new [*'A'..'Z']
		@lowercase = CharGroup.new [*'a'..'z']
		@marks = CharGroup.new ["!", "?", ",", ".", " ", ";",  "\"", "'"]
	end

	def decode_message(encrypted_msg)
		encrypted_msg_array = encrypted_msg.split(",")
		decoded_message = ""
		mode = @uppercase

		encrypted_msg_array.each do |s|
			remainder = s.to_i % mode.get_modulo
			if remainder != 0
				decoded_message << mode.get_char(remainder)
			else
				mode = check_mode(mode)
			end
		end

		decoded_message
	end

	private
	def check_mode(mode)
		case mode
		when @uppercase then @lowercase
		when @lowercase then @marks
		when @marks then @uppercase
		end
	end
end

decode_message = DecodeMessage.new
puts decode_message.decode_message("33,54,21,68,38,42,45,69,34,28,46,62,90,27,28,81,31,54,32,46,21")

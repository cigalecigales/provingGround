# アルファベットと記号
ALPHABET_L = [*'A'..'Z']
ALPHABET_S = [*'a'..'z']
MARKS = ["!", "?", ",", ".", " ", ";", "\"", "'"]

# モード一覧
MODE_ALPHABET_L = "1"
MODE_ALPHABET_S = "2"
MODE_MARKS = "3"

def decode_message(message)
	message_array = message.split(",")
	decoded_message = ""
	mode = MODE_ALPHABET_L
	numval = 27

	message_array.length.times do |i|
		value = message_array[i].to_i % numval
		if value != 0
			decoded_message << get_char(mode, value)
		else
			mode = check_mode(mode)
			numval = check_numval(mode)
		end
	end
	decoded_message
end

private
def check_mode(mode)
	case mode
	when MODE_ALPHABET_L then MODE_ALPHABET_S
	when MODE_ALPHABET_S then MODE_MARKS
	when MODE_MARKS then MODE_ALPHABET_L
	end
end

def check_numval(mode)
	case mode
	when MODE_ALPHABET_L then 27
	when MODE_ALPHABET_S then 27
	when MODE_MARKS then 9
	end
end

def get_char(mode, value)
	case mode
	when MODE_ALPHABET_L then ALPHABET_L[value - 1]
	when MODE_ALPHABET_S then ALPHABET_S[value - 1]
	when MODE_MARKS then MARKS[value - 1]
	end
end


puts decode_message("33,54,21,68,38,42,45,69,34,28,46,62,90,27,28,81,31,54,32,46,21")

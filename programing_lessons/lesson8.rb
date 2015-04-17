def checkValue(data)
	data_str = data.to_s
	check = []
	data_str.reverse.each_char.with_index do |char, i|
		digit = char.to_i * ((i % 2) + 1)
		digit = (digit - 10) + 1 if digit >= 10
		check << digit
	end

	sum = check.inject(:+)
	puts "#{ data }は#{ (sum % 10).zero? ? "有効な値" : "無効な値" }です。"
end

checkValue(123455)

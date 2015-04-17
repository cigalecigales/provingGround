def checkValue(data)
	sum = 0
	(1..data.length).each do |i|
		digit = data[-i].to_i
		if i.odd?
			sum += digit
		else
			sum += digit * 2
			sum += 1 if digit >= 5
		end
	end

	if sum % 10 == 0
		puts "有効な値"
	else
		puts "無効な値"
	end
end

checkValue("123455")

=begin
def checkValue1(*value)
	puts value.length
end

puts checkValue1(123455)
=end


def checkValue2(value)
	strValue = value.to_s
	loopCount = (strValue.length - 1) - 1
	checkSum = 0
	checkDigit = strValue[strValue.length - 1].to_i

	loopCount.downto(0) do |i|
		val = strValue[i].to_i
		puts val
		if val % 2 == 1
			if (val * 2).to_s.length == 2
				checkSum += 1 + val[1].to_i
			else
				checkSum += val * 2
			end
		else
			checkSum += val
		end
	end

	if (checkSum + checkDigit) % 10 == 0
		puts strValue + "は有効な値です。"
	else
		puts strValue + "は無効な値です。"
	end
end

checkValue2(123455)

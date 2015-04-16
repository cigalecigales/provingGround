def checkValue2(value)
	strValue = value.to_s
	loopCount = (strValue.length - 1) - 1
	checkSum = 0
	checkDigit = strValue[strValue.length - 1].to_i

	if (strValue.length - 1) % 2 == 0
		loopCount.downto(0) do |i|
			val = strValue[i].to_i
			if (i + 1) % 2 == 0
				if (val * 2) >= 10
					checkSum += (1 + (val * 2 % 10))
				else
					checkSum += val * 2
				end
			else
				checkSum += val
			end
			puts i.to_s + ":" + checkSum.to_s
		end
	else
		loopCount.downto(0) do |i|
			val = strValue[i].to_i
			if (i + 1) % 2 == 1 
				if (val * 2) >= 10
					checkSum += (1 + (val * 2 % 10))
				else
					checkSum += val * 2
				end
			else
				checkSum += val
			end
			puts "kisuu" + i.to_s + ":" + checkSum.to_s
		end
	end

	if (checkSum + checkDigit) % 10 == 0
		puts strValue + "は有効な値です。"
	else
		puts strValue + "は無効な値です。"
	end
end

checkValue2(123455)
checkValue2(123456)
checkValue2(346286128821646820211)
checkValue2(19)
checkValue2(18)

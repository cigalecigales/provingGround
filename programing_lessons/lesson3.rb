def check1(digit)
	doubledDigit = digit * 2
	sum = 0
	if doubledDigit >= 10
		sum = 1 + doubledDigit % 10
	else
		sum = doubledDigit
	end
end

puts check1(9)
puts check1(3)

def check2(digit)
	doubledDigit = digit * 2
	doubledDigit
end

puts check2("3")

def check3(number)
	checksum = 0
	
	5.times do |i|
		
	end

	if checksum % 10 == 0
		puts "有効な識別番号です。"
	else
		puts "無効な識別番号です。"
	end
end

puts check3(12345)

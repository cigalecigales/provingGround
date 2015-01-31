times = []

for i in 1..5 do
	times.push(Time.mktime 2000+i, 1, 1, 00, 00, 00)
end

for i in 1..5 do
	times.push(Time.mktime 2000+i, 1, 1+i, 00, 00, 00)
end

puts times

puts "*** 日付を「??/??」形式で入力 ***"
input_day = gets()

month = input_day[0..1].to_i
day = input_day[3..4].to_i

puts month
puts day

result = []
times.each do |time|
	if time.month == month && time.day == day
		result.push(time)
	end
end

puts result

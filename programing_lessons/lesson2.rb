# 以下を表示する。
#
# #
# ##
# ###
# ####
# ###
# ##
# #

1.upto(3) do |i|
	print("#" * i + "\n")
end
4.downto(1) do |i|
	print("#" * i + "\n")
end

1.upto(3){ |i| puts "#" * i }
4.downto(1){ |i| puts "#" * i }

[*1..3].each{ |i| puts "#" * i }
[*1..4].reverse.each{ |i| puts "#" * i }

puts 1.upto(3).map{ |i| "#" * i }
puts 4.downto(1).map{ |i| "#" * i }

[*1,2,3,4,3,2,1].each{ |i| puts "#" * i }

7.times do |i|
	(4-(3-i).abs).times do |j|
		print "#"
	end
	puts ""
end

7.times{ |i| puts "#" * (4-(3-i).abs) }

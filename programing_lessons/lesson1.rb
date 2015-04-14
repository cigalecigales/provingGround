# 以下を表示するプログラムを考える。
#
# #####
# ####
# ###
# ##
# #

count = 5
5.times do
	print("#"*count+"\n")
	count -= 1
end

# for文でデクリメントされないっぽい
for i in 1..5
	for j in 5..1
		print("#"*j)
	end
	print("\n")
end

# upto, downtoがあるみたい
5.downto(1) do |i|
	print("#" * i)
	print("\n")
end

# 何も表示されない
for i in 3..1
	p i
end

5.downto(1){ |i| print("#" * i + "\n") }

hash_count = 8
space_count = 0
4.times do
	print " " * (space_count / 2)
	print "#" * hash_count
	print " " * (space_count / 2)
	puts ""

	hash_count -= 2
	space_count += 2
end

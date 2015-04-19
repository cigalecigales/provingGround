class Test
	def initialize(ary)
		@char_group = [*ary]
	end

	def get_char
		@char_group
	end
end

test = Test.new [*'A'..'Z']
puts test.get_char.length
p test.get_char

#
# Abstract Factory･･･矛盾の無いオブジェクトの組み合わせを作る
#
# sample by http://morizyun.github.io/blog/ruby-design-pattern-14-abstract-factory/
#
class Duck
	def initialize(name)
		@name = name
	end

	def eat
		puts "アヒル#{ @name }は食事中"
	end
end


class Frog
	def initialize(name)
		@name = name
	end

	def eat
		puts "カエル#{ @name }は食事中"
	end
end


class Alage
	def initialize(name)
		@name = name
	end

	def grow
		puts "藻#{ @name }は成長中"
	end
end


class WaterLily
	def initialize(name)
		@name = name
	end

	def grow
		puts "睡蓮#{ @name }は成長中"
	end
end

duck = Duck.new("duck")
frog = Frog.new("frog")
alage = Alage.new("alage")
waterLily = WaterLily.new("waterLily")

puts duck.eat
puts frog.eat
puts alage.grow
puts waterLily.grow

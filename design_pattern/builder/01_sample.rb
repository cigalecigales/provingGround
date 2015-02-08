# 
# Builder
#
# sample by http://morizyun.github.io/blog/ruby-design-pattern-12-builder/
#
class SugarWater
	attr_accessor :water, :sugar
	def initialize(water, sugar)
		@water = water
		@sugar = sugar
	end
end

class SugarWaterBuilder
	def initialize
		@sugar_water = SugarWater.new(0, 0)
	end

	def add_sugar(sugar_amount)
		@sugar_water.sugar += sugar_amount
	end

	def add_water(water_amount)
		@sugar_water.water += water_amount
	end

	def result
		@sugar_water
	end
end

class Director
	def initialize(builder)
		@builder = builder
	end

	def cook
		@builder.add_water(150)
		@builder.add_sugar(90)
	end
end


builder = SugarWaterBuilder.new
director = Director.new(builder)
director.cook

puts builder.result

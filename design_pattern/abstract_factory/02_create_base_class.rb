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


class Algae
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

class OrganismFactory
	def initialize(number_animals, number_plants)
		@animals = []

		number_animals.times do |i|
			animal = new_animal("動物#{i}")
			@animals << animal
		end

		@plants = []

		number_plants.times do |j|
			plant = new_plant("植物#{j}")
			@plants << plant
		end
	end

	def get_animals
		@animals
	end

	def get_plants
		@plants
	end
end

class FrogAndAlgaeFactory < OrganismFactory
	private
		def new_animal(name)
			Frog.new(name)
		end

		def new_plant(name)
			Algae.new(name)
		end
end

class DuckAndWaterLilyFactory < OrganismFactory
	private
		def new_animal(name)
			Duck.new(name)
		end

		def new_plant(name)
			WaterLily.new(name)
		end
end


factory = FrogAndAlgaeFactory.new(4,1)
animals = factory.get_animals
animals.each{ |animal| animal.eat }
plants = factory.get_plants
plants.each{ |plant| plant.grow }

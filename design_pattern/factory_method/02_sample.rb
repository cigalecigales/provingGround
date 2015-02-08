# 
# Factory Method
#
# sample by http://morizyun.github.io/blog/ruby-design-pattern-11-factory-method/
#
class Saxophone
	def initialize(name)
		@name = name
	end

	def play
		puts "#{ @name } is playing..."
	end
end

class Trumpet
	def initialize(name)
		@name = name
	end

	def play
		puts "#{ @name } is playing..."
	end
end

class InstrumentFactory
	def initialize(number_instruments)
		@instruments = []
		number_instruments.times do |i|
			instrument = new_instrument("instrument#{ i }")
			@instruments << instrument	
		end
	end

	def ship_out
		@tmp = @instruments.dup # レシーバオブジェクトのコピーを生成
		@instruments = []
		@tmp
	end
end

class SaxophonesFactory < InstrumentFactory
	def new_instrument(name)
		Saxophone.new(name)
	end
end

class TrumpetsFactory < InstrumentFactory
	def new_instrument(name)
		Trumpet.new(name)
	end
end


factory = SaxophonesFactory.new(3)
saxophones = factory.ship_out
saxophones.each{ |saxophone| saxophone.play }

factory = TrumpetsFactory.new(5)
trumpets = factory.ship_out
trumpets.each{ |trumpet| trumpet.play }

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

class InstrumentFactory
	def initialize(number_saxophones)
		@saxophones = []
		number_saxophones.times do |i|
			saxophone = Saxophone.new("saxophone#{ i }")
			@saxophones << saxophone
		end
	end

	def ship_out
		@tmp = @saxophones.dup # レシーバオブジェクトのコピーを生成
		@saxophones = []
		@tmp
	end
end


factory = InstrumentFactory.new(3)
saxophones = factory.ship_out
saxophones.each{ |saxophone| saxophone.play }

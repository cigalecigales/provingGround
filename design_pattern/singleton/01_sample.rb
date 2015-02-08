# 
# Singleton
#
# sample by http://morizyun.github.io/blog/ruby-design-pattern-10-singleton/
#
require 'singleton'

class SingletonObject
	include Singleton
	# instanceメソッド定義。newメソッドがprivateに。
	attr_accessor :counter

	def initialize
		@counter = 0
	end
end


obj1 = SingletonObject.instance
obj1.counter += 1
puts obj1.counter

obj2 = SingletonObject.instance
obj2.counter += 1
puts obj2.counter

obj3 = SingletonObject.new
# private method `new' called for SingletonObject:Class (NoMethodError)

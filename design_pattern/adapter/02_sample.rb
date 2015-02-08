# 
# Adapter
#
# sample by http://morizyun.github.io/blog/ruby-design-pattern-07-adapter/
# 
class Printer
	def initialize(obj)
		@obj = obj
	end

	def print_weak
		@obj.print_weak
	end

	def print_strong
		@obj.print_strong
	end
end

class OldPrinter
	def initialize(string)
		@string = string.dup
	end

	def show_with_bracket
		puts "[#{ @string }]"
	end

	def show_with_asterisk
		puts "**#{ @string }**"
	end
end


text = OldPrinter.new("Hello")
def text.print_weak
	show_with_bracket
end

def text.print_strong
	show_with_asterisk
end

p = Printer.new(text)
p.print_weak
p.print_strong

# 特異オブジェクト･･･メソッドを特定のオブジェクトに追加

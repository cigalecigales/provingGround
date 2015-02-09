# 
# Composite
# 
# sample by http://morizyun.github.io/blog/ruby-design-pattern-04-composite/
#
class Entry
  def get_name; end
  def ls_entry(prefix); end
  def remove; end
end

class FileEntry < Entry
  def initialize(name)
    @name = name
  end
  
  def get_name
    @name
  end
  
  def ls_entry(prefix)
    puts(prefix + "/" + get_name) 
  end
  
  def remove
    puts "remove:#{@name}"
  end
end

class DirEntry < Entry
  def initialize(name)
    @name = name
    @directory = Array.new
  end
  
  def get_name
    @name
  end
  
  def add(entry)
    @directory.push(entry)
  end
  
  def ls_entry(prefix)
    puts(prefix + "/" + get_name)
    @directory.each do |e|
      e.ls_entry(prefix + "/" + @name)
    end
  end
  
  def remove
    @directory.each do |i|
      i.remove
    end
    puts "remove:#{@name}"
  end
end
  
root = DirEntry.new("root")
tmp = DirEntry.new("tmp")
tmp.add(FileEntry.new("conf"))
tmp.add(FileEntry.new("data"))
root.add(tmp)

root.ls_entry("")

root.remove
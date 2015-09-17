# Function
def return_boolean
    true
end
puts return_boolean

# Minus index
arr = [1, 2, 3, 4]
puts arr[-1]
puts '---'
puts arr[1..2]
puts '---'
puts (1..2).class

# Array class
puts [].class
puts [].methods.include?(:[])

# Yield
3.times {puts 'hi'}
arr.each {|item| puts item}

# Add repeat method for fixnumber
class Fixnum
    def repeat
        i = self
        while i > 0
            i = i - 1
            # There is no i-- for Fixnum instance does not have that function
            yield
        end
    end
end

3.repeat {puts 'hi'} # Try my repeat

# Closure, use function as parameter
# Function is defined on the main:Object class
def call_block (&block)
    block.call
end

call_block {puts 'test'}

# Relationship
puts '-relationship-'
puts 4.class
puts 4.class.class
puts 4.class.class.superclass
puts 4.class.class.superclass.superclass

# Class practice
class Tree
    attr_accessor :children, :name

    def initialize(name, children=[])
        @children = children
        @name = name
    end

    def visit_all (&block)
        visit &block #Pay attension to & symbol here
        @children.each {|child| child.visit_all &block}
    end

    def visit(&block)
        block.call self
    end
end

tree = Tree.new('root', [
    Tree.new('left'),
    Tree.new('right')
])

tree.visit {|node| puts node.name}
tree.visit_all {|node| puts node.name}

# Mixin sample

module Writter # Must be uppercase show that it is a constant name
    def put_line
        puts 'line'
    end

    def put_lines
        puts 'lines'
    end
end

class Tester
    include Writter
end

tester = Tester.new
tester.put_line
tester.put_lines

# Enumerable Comparable

puts 1 <=> 3
puts arr.all? {|num| num > 0}
puts arr.sort
puts arr.select {|num| num % 2 == 0}
puts arr.collect{|num| num*2}
# Is it interesting?
puts arr.max { |a, b| b - a }
puts arr.member?(7)
puts arr.inject(0) {|sum ,i| sum + i} #Same like javascript reduce

# Open file

file = File.new('day1.rb', "r") # Or File.open
file.each { |line|
    puts line
}
file.close

# Block pattern will close file automatically, errors will be collected
File.open('day1.rb', "r") { |file|
    file.each { |line|
        puts line
    }
}

# Array and hash map
arr = [[:a, "apple"], [:b, "bear"]]
hash = Hash[arr]
puts hash
arr = []
hash.each {|key, value| arr.push(value)}
puts arr
hash = {}
i = 0
arr.each { |item| 
    hash[i] = item
    i = i + 1
}
puts hash

# Stack
arr = [1, 2, 3]
arr.push(4)
arr.pop()
arr.pop()
puts arr

# List
arr.shift()
arr.push(3)
puts arr

# Set
puts '--uniq--'
arr.unshift(3)
puts arr.uniq
puts '-----'
puts arr 

# Group slice in array
puts '--slice--'
arr = []
(1..16).each { |num|
    if 0 != num % 4
        arr.push(num)
    else
        p arr.push num
        arr = []
    end
}

(1..16).each_slice(4) { |slice|
    p slice
}

def hash_to_array (hash)
    arr = []
    hash.each { |key, value|
        arr.push (key)
    }
    arr
end

class Tree
    def initialize(hash)
        hash.each { |k, v|
            @name = k
            @children = map_to_array(v)
        }
    end
end

tree = Tree.new({'root' => {'left' => {}, {'left' => {}}}})
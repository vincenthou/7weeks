# Active Record
#class Department < ActiveRecord::Base
#    has_many :employees
#    has_one :manager
#end

# Meta programing

# Open class
# Looks like changing prototype function for core Object of JS
class NilClass
    def blank?
        true
    end
end 

class String
    def blank?
        self.size == 0
    end
end

["", "name", nil].each do |item|
    puts item unless item.blank?
end

class Numeric
    def add
        self + 1
    end

    def sub
        self - 1
    end

    # Static method
    def self.test
        "test"
    end
end

puts 10.add
puts 10.sub
puts Numeric.test

class Class
    def test
        "testClass"
    end 
end

puts Numeric.class
# Static method will override Class instance method
puts Numeric.test

# Missing methods
# Looks like PHP 5.3 __call and __callStatic

class Vincent
    def self.method_missing name, *args
        p name
        case name.to_s
        when 'cname'
            puts "Vincent"
        when 'height'
            puts 172
        else
            puts 'Nothing to show'
        end
    end
    def method_missing name, *args
        p name
        puts "It is the #{name.to_s} method"
    end
end

Vincent.cname
Vincent.height
Vincent.haha
vincent = Vincent.new
vincent.say

# Read file with class name
class ActsAsCsv
    def read
        file = File.new("#{self.class.to_s.downcase}.csv")
        @headers = file.gets.chomp.split(',')

        file.each do |row|
            @result << row.chomp.split(',')
        end
    end

    def headers
        @headers
    end

    def contents
        @result
    end

    def initialize
        @result = []
        read
    end
end

class Member < ActsAsCsv
end

file = Member.new
puts file.headers.inspect
puts file.contents.inspect

# Use macro: call static method to define methods
class ActsAsCsv
    def self.acts_as_csv
        define_method 'read' do
            file = File.new("#{self.class.to_s.downcase}.csv")
            @headers = file.gets.chomp.split(',')

            file.each do |row|
                @result << row.chomp.split(',')
            end
        end

        define_method 'headers' do
            @headers
        end

        define_method 'contents' do
            @result
        end

        define_method 'initialize' do
            @result = []
            read
        end
    end
end

class Member < ActsAsCsv
    acts_as_csv
end

puts '--Use macro--'

file = Member.new
puts file.headers.inspect
puts file.contents.inspect

# Tip: Should comment 2 exmples above, same name for module
# Use module and include, get rid of direct extending
module ActsAsCsv
    def self.included(base)
        p base
        base.extend ClassMethods
    end

    module ClassMethods
        def acts_as_csv
            include InstanceMethods
        end
    end

    class Line
        def initialize(map)
            @map = map
        end

        def method_missing name
            @map[name.to_s]
        end
    end

    module InstanceMethods
        def read
            file = File.new("#{self.class.to_s.downcase}.csv")
            @headers = file.gets.chomp.split(',')

            file.each do |row|
                @contents << row.chomp.split(',')
            end
        end

        def each(&block)
            @contents.each do |line|
                line_map = {}
                i = 0
                headers.each { |header|
                    line_map[header] = line[i]
                    i = i + 1 
                }
                block.call(Line.new(line_map))
            end
        end

        attr_accessor :headers, :contents

        def initialize
            @contents = []
            read
        end
    end
end

class Member
    include ActsAsCsv
    acts_as_csv
end

puts '--Use module, include--'

file = Member.new
puts file.headers.inspect
puts file.contents.inspect
file.each {|row| p row.name}
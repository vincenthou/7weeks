# Replace (? replace method used as assignment)
str = 'test'
str.sub('e', 'a')
puts str
# Hardly
str.sub!('e', 'a')
puts str
str = 'teeeeest'
str.sub('e', 'a')
puts str
# Globally
str.gsub('e', 'a')
puts str

# Regexp
a = "hello there"
a[/[aeiou](.)\1/]      #=> "ell"
a[/[aeiou](.)\1/, 0]   #=> "ell"
a[/[aeiou](.)\1/, 1]   #=> "l"
a[/[aeiou](.)\1/, 2]   #=> nil

a[/(?<vowel>[aeiou])(?<non_vowel>[^aeiou])/, "non_vowel"] #=> "l"
a[/(?<vowel>[aeiou])(?<non_vowel>[^aeiou])/, "vowel"]     #=> "e"

"hi mom".split(%r{\s*})         #=> ["h", "i", "m", "o", "m"]
"hello".sub(/[aeiou]/, '*')     #=> "h*llo"

# Match data: http://doc.rubyfans.com/ruby/v2.0/classes/MatchData.html

# Loop
10.times {|i| puts "#{i+1} times"}
(1..10).each{|i| puts "#{i} times"} # Use range
i = 0 # Use while
while i < 10
    puts "#{i+1} times"
    i = i + 1
end

# Number Game
num = rand(10)
input  = 100
while num != input
    input = gets.to_i # Actaully it is two function call
    if input < num
        puts 'Larger'
    elsif input > num
        puts 'Smaller'
    else
        puts 'You win'
    end
end
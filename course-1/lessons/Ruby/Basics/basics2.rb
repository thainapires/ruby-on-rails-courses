#Strings

#single quote: allow escaping of ' with \
#double quote: interpret special characters like \n and \t | allow string interpolation

#Don't bother concatenating with +

single_quoted = 'ice cream \n followed by it\'s a party!'
double_quoted = "ice cream \n followed by it\'s a party!"

def multiply (one, two)
    "#{one} multiplied by #{two} equals #{one * two}" #interpolation only for double quoted strings
end
puts multiply(5,3)

#string methods returns a copy
#! modifys the string

my_name= " tim"
puts my_name.lstrip.capitalize
p my_name
my_name.lstrip!
my_name[0] = "K"
puts my_name

cur_weather = %Q{It's a hot day outside
                grab your umbrellas...}
cur_weather.lines do |line|
    line.sub! 'hot', 'rainy'
    puts "#{line.strip}"
end

#Strings API

"hello".include? "lo"

"hello".include? "ol"

"hello".include? "?h"

#Symbols: other kind of string
#:foo- Highly optimized strings, constant names that you dont have to predeclare, stands for something
#are garanteed to be unique and immutable

#Representation of method name

"hello".methods.grep /case/
#method name: :upcase!

#Arrays

#In ruby arrays are auto-expandable, and heterogeneous types are allowed
#can use %w{str1 str2} for string array creation

het_arr = [1, "two", :three]

arr_words = %w{ what a great day today! }
puts arr_words[-2]
puts "#{arr_words.first} - #{arr_words.last}"
p arr_words[-3, 2] #go back three, and take two

p arr_words[2..4]

puts arr_words.join(',')

#Modifying arrays

stack = []; stack << "one"; stack.push("two")
puts stack.pop
puts stack

queue = []; queue.push "one"; queue.push "two"
puts queue.shift

a = [5,3,4,2].sort!.reverse!
p a
p a.sample(2)

a[6] =33
p a

#other methods: each, select, reject, map

a = [1,3,4,7,8,10]
a.each { |num| print num }
puts

new_arr = a.select { |num| num > 4 }
p new_arr
new_arr = a.select { |num| num < 10 }
            .reject{ |num| num.even? }
p new_arr

new_arr = a.map{|x| x * 3}
p new_arr

#Ranges: Used to express natural consecutive sequences
#Two rules: 
#two dots -> all-inclusive
#three dots -> end-exclusive

some_range = 1..3
puts some_range.max
puts some_range.include? 2

puts (1...10) === 5.3
puts ('a'...'r') === "r"

p ('k'..'z').to_a.sample(2)

age = 55
case age
    when 0..12 then puts "Still a baby"
    when 13..99 then puts "Teenager at heart!"
    else puts "You are getting older..."
end

#hashes: Indexed collections of object references, also known as associative arrays
#Index(key) can be anything, not just an integer
#access => []

editor_props = {"font" => "Arial", "size" =>12, "coolor" => "red"}
puts editor_props.length
puts editor_props["font"]

editor_props["background"] = "Blue"
editor_props.each_pair do |key, value|
    puts "Key: #{key} value: #{value}"
end 

#hash.new(0) #default value

word_frequencyy = Hash.new(0)
sentence = "Chicka chicka boom boom"
sentence.split.each do |word|
    word_frequencyy[word.downcase] += 1
end

p word_frequencyy

family_tree_19 = {oldest: "Jim", older:"Joe", younger: "Jack"}
family_tree_19[:youngest] = "Jeremy"
p family_tree_19

def adjust_colors (props = {foreground: "red", background: "white"})
    puts "Foreground: #{props[:foreground]}" if props[:foreground]
    puts "Foreground: #{props[:background]}" if props[:background]
end
puts adjust_colors
puts adjust_colors ({:foreground =>"green"})
puts adjust_colors background: "yella"
puts adjust_colors :background => "magenta"

a_hash = {:one => "one"}
puts({:one => "one"})
puts one: "one"
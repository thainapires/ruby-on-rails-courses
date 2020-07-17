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

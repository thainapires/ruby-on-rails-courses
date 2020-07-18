#puts 3

a = 5
if a == 3
    puts "a is 3"
elsif a == 5
    puts "a is 5"
else
    puts "a is not 3 or 5"
end

a = 5

unless a == 6
    puts "a is not 6"
end

a  = 10

while a > 9
    puts a
    a -= 1
end

a = 9

until a >= 10
    puts a
    a+= 1
end

a = 5
b = 0

puts "One liner" if a == 5 and b == 0

times_2=2
times_2*=2 while times_2 <100
puts times_2

#Triple equals

if /sera/ === "coursera"
    puts "Triple Equals"
end

if "coursera" === "coursera"
    puts "also works"
end

if Integer === 21 
    puts "21 is an Integer"
end

if Integer == 21 
    puts "21 is an Integer"
else
    puts "21 is not equal to Integer"
end

#case expressions

age = 21
case 
    when age >= 21
        puts "You can buy a drink"
    when 1 == 0
        puts "Written by a drunk programmer"
    else
        puts "Default condition"
end

name = 'Fisher'
case name 
    when /fish/i then puts "Something is fishy here"
    when 'Smith' then puts "Your name is Smith"
end


#For loops

for i in 0..2
    puts i
end

#Functions and methods

def simple
    puts "no parens"
end

def simple1()
    puts "yes parens"
end

simple()
simple
simple1

def add(one, two)
    one + two
end

def divide(one, two)
    return "I don't think so" if two ==0
    one / two
end

puts add(2, 2)
puts divide(2,0)
puts divide(12, 4)

def can_divide_by?(number)
    return false if number.zero?
    true
end

puts can_divide_by? 3 
puts can_divide_by? 0

def factorial (n)
    n == 0? 1 : n * factorial(n-1)
end

def factorial_with_default(n=5)
    n == 0? 1 : n * factorial_with_default(n-1)
end

puts factorial 5
puts factorial_with_default
puts factorial_with_default(3)

#splat

#def max(one_param, *numbers, another)
#    numbers.max
#end

#puts.max("something", 7, 32, -4, "more")

#Blocks are chunks of code that are being excecuted, often used as iterators

1.times {puts "Hello World!"}

2.times do |index|
    if index >0
        puts index
    end
end

2.times{ |index| puts index if index >0}

def two_times_implicit
    return "No block" unless block_given?
    yield
    yield
end

puts two_times_implicit {print "Hello"}
puts two_times_implicit

def two_times_explicit (&i_am_a_block)
    return "No block" if i_am_a_block.nil?
    i_am_a_block.call
    i_am_a_block.call
end

puts two_times_explicit
two_times_explicit {puts "Hello"}

#Files

File.foreach('test.txt') do |line|
    puts line
    p line
    p line.chomp
    p line.split
end

begin
    File.foreach('do_not_exist.txt') do |line|
        puts line.chomp
    end
rescue Exception => e
    puts e.message
    puts "Let's pretend this didn't happen..."
end

if File.exist? 'test.txt'
    File.foreach('test.txt') do |line|
        puts line.chomp
    end
end

File.open("test1.txt", "w") do |file|
    file.puts "One line"
    file.puts "Another"
end


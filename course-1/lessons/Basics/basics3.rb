#Classes
#Begin with @, not declared
#Classes are factories - Calling new method creates an instance of class

class Person
    def initialize (name, age)
        @name = name
        @age = age
    end
    
    def get_info
        @additional_info = "Interesting"
        "Name: #{@name}, age: #{@age}"
    end

    def name
        @name
    end
    
    def name= (new_name)
        @name = new_name
    end
end

person1 = Person.new("Joe", 14)
p person1.instance_variables
puts person1.get_info
p person1.instance_variables
person1.name = "Mike"
puts person1.name

#Easier way

class Person2
    attr_accessor :name, :age
    #Also attr_reader, attr_writer
end

person1 =Person2.new
p person1.name
person1.name = "Mike"
person1.age = 15
puts person1.name
puts person1.age
person1.age =  "fifteen"
puts person1.age

class Person3
    attr_reader :age
    attr_accessor :name

    def initialize (name, ageVar) #constructor
        @name = name
        self.age = ageVar
        puts age
    end
    def age= (new_age)
        @age = new_age unless new_age > 120
    end
end

person2 = Person3.new("Kim", 13)
puts "My age is #{person2.age}"
person2.age = 130
puts person2.age

#||

class Person4 
    attr_reader :age
    attr_accessor :name

    def initialize (name, age)
        @name = name
        self.age = age
    end
    def age= (new_age)
        @age || 5
        @age = new_age unless new_age > 120
    end
end

person4 = Person4.new("Kim", 130)
puts person4.age
person4.age = 10
puts person4.age

# Class methods and variables (three ways to define)
class MathFunctions
    def self.double(var)
        times_called; var *2;
    end
    class << self
        def times_called
            @@times_called ||= 0; @@times_called +=1
        end
    end
end
def MathFunctions.triple(var)
    times_called; var*3
end

puts MathFunctions.double 5
puts MathFunctions.triple(3)
puts MathFunctions.times_called

#Class inheritance (Does not support multiple inheritance, uses mixins)
class Dog
    def to_s
        "Dog"
    end
    def bark
        "barks only"
    end
end
class SmallDog < Dog
    def bark 
        "barks quietly"
    end
end

dog = Dog.new
small_dog = SmallDog.new
puts "#{dog}1 #{dog.bark}"
puts "#{small_dog}2 #{small_dog.bark}"


#Modules (NameSpace or mixin)

module Sports
    class Match
        attr_accessor :score
    end
end

module Patterns
    class Match
        attr_accessor :complete
    end
end

match1 = Sports::Match.new
match1.score = 45
puts match1.score

match2 = Patterns::Match.new
match2.complete = true
puts match2.complete

#Module as mixin (provide a way to share ready code among multiple classes)

module SayMyName
    attr_accessor :name
    def print_name
        puts "Name: #{@name}"
    end
end

class Person5
    include SayMyName
end
class Company
    include SayMyName
end

#Enumerable Module: Files basics3.1 and player/team

#Scope

v1 = "outside"

class MyClass
    def my_method
        v1 = "inside"
        p v1
        p local_variables
    end
end

p v1
obj = MyClass.new
obj.my_method
p local_variables
p self

#Constant (Begin with uppercase)

module Test
    PI = 3.14
    class Test2
        def what_is_pi
            puts PI
        end
    end
end
Test::Test2.new.what_is_pi

module MyModule
    MyConstant = 'Outer Constant'
    class MyClass
        puts MyConstant
        MyConstant = 'Inner Constant'
        puts MyConstant
    end
    puts MyConstant #Doesnt change outside
end

#Access Control (3 levels: public, protected and private)

class MyAlgorithm
    private
        def test1 #cannot be invoked with an explicit receiver
            "Private"
        end
    protected #classes and subclasses
        def Test2
            "Protected"
        end
    public 
        def public_again
            "Public"
        end
end

class Another
    def test1
        "Private, as declared later on"
    end
    private :test1
end





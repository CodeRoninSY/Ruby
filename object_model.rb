#!/usr/bin/env ruby -w
#
# object_model.rb
#
# Dev: CodeRoninSY
# Date: 2020-12-24
#
# Youtube: https://www.youtube.com/watch?v=X2sgQ38UDVY
# Ruby object model by Dave Thomas
# Good talk about internal representation on Ruby object model
#
# self:
# ..
# object -> contains state and behaviors, behavior -> class methods, i.e. obj.methods
#
# Singleton class: eigenclass, metaclass
#
# ** Golden rule:
# .. instance variables: look up in self
# .. methods: look up in self's class

puts ->() {
       animal = 'cat'

       # singleton_method
       def animal.speak
         puts 'meowww'
       end

       def animal.run
         puts 'prrrrrrrrr'
       end

       # puts animal.upcase
       # puts animal.object_id

       animal.speak
       animal.run

       puts self # 'puts' is coming from main, since self takes 'the object' and it comes from main
       # puts self.speak # undefined method 'speak' for main:Object
       puts animal.itself # returns the receiver, i.e. 'animal', its state = cat

       # p animal.methods
       p animal.is_a?(String)
       p animal.nil?
       p animal.tr('a-z', 'a-r#*?/.:;+')

       animal.each_char do |c|
         printf("%s ", c)
       end

       puts

       class Dove # class is a constant of class Object
         puts self # objects are executable code, so self-> prints 'Dove'
         puts self.class

         def self.speak
           puts 'Hello!'
         end
       end

       Dove.speak

       # Struct creates an class/object on the fly
       class Person < Struct.new(:name, :age) 
         def to_s
           "Hello #{self.name}, you are #{self.age}."
         end
       end

       dave = Person.new('Dave', 42)
       puts dave.to_s
       puts dave.name, dave.age

       class Address < Struct.new(:street, :city, :zip, :state)
         def to_s
           "#{self.street}\n#{self.city}, #{self.state} #{self.zip}"
         end
       end

       addr = Address.new('123 Main', 'Springfield', '75123', 'IL')

       puts addr.to_s

       # Include & Extend
       # Module behaves like textual fetch and insert into object
       module M
         def speak
           puts 'hi'
         end
       end

       class Dave
         include M
       end

       d = Dave.new

       # changing a module automatically changes the behavior of the object
       module M
         def speak
           puts 'this is updated'
         end
       end

       d.speak
     }.()

#!/usr/bin/env ruby -w
#
# singleton_module.rb
#
# Dev: CodeRoninSY
# Date: 2020-12-24
#
# Youtube: https://www.youtube.com/watch?v=r8LwiJVVtzo
# The Singleton module and its pattern
#
# https://ruby-doc.org/stdlib-2.7.2/libdoc/singleton/rdoc/Singleton.html
#
# Concerns:
# * concurrent access to a shared resource
# * global state
# * violation of SRP (single responsibility pattern)
# * testing is problematic
# * encourages tight coupling
#
# Appropriate use cases
# * unidirectional flow of data
# * resource requested from multiple and disparate areas
# * logging
# * configurations
# * nothing modified within the application
#
# singleton.rb
# * .new and .allocate are made private
# * .instance added
# * .clone and .dup
#

require 'singleton'

puts ->() {

       # SingletonExample
       class SingletonExample
         include Singleton

         attr_accessor :the_goggles

         def say_something
           'something'
         end
       end

       # Ruby Singleton Class
       # also referred to as 'eigenclass' or 'metaclass'
       # somewhat hidden
       # essential of the ruby object model
       # BasicObject -> Object -> <Defined>
       # Modules are included above their including object

       class ConferenceTalk; end

       ConferenceTalk.ancestors
       # pry => [ConferenceTalk, Object, PP::ObjectMixin, Kernel, BasicObject]
       String.ancestors

       # Example 'Cat'
       class Cat
         @@house_cats = []

         def self.move_in(cat)
           @@house_cats << cat
         end

         def self.in_house
           @@house_cats
         end

         def initialize(description)
           @description = description
         end

         def speak
           'Prrrr'
         end
       end

       pearl = Cat.new('tabby')
       pearl.speak

       Cat.move_in(pearl)

       Cat.in_house

       pk = Cat.new('spotted')

       Cat.move_in(pk)

       p Cat.instance_variables
       p Cat.class_variables
       p Cat.class_variable_get(:@@house_cats)

       # pk gets its singleton class
       def pk.speak
         'maoooooww'
       end

       p Cat.singleton_class
       p Cat.method_defined? :move_in
       p Cat.singleton_class.method_defined? :move_in

       def pk.snore
         'wheeze'
       end

       p pk.snore

       p pk.singleton_class.method_defined? :snore

       p pk.methods.include? 'snore'

       p pearl.singleton_class.method_defined? :snore

       # another example - Schrodinger's cat
       class Cat
         def self.check_box
           "See a #{status} cat"
         end

         private
         
         def self.status
           ['live', 'deceased'].sample
         end
       end

       p Cat.check_box
       p Cat.status

     }.()

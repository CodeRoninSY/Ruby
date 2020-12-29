#!/usr/bin/env ruby -w
#
# rubyconf13_bigpicture_jweirich.rb
#
# Dev: CodeRoninSY
# Date: 2020-12-25
#
# RubyConf2013
# The big picture:
# https://www.youtube.com/watch?v=VyuMWYzl9gM&list=PLE7tQUdRKcyYCsMvCcskeBe9DkSSt0oR2&index=29
#
# UML as:
# * sketch
# * blueprint (no)
# * programming language (no)
#
# Example: Dependencies
# UML shows dependencies really good
#
# Tools: 
# * UMLet : uml java app
# * OmniGraffle: graphing uml diagrams

puts ->() {

       # Ruby has modules
       module Driveable
       end

       # Car class
       class Car
         include Driveable

         def initialize
           @engine = Engine.new
           @wheels =
             4.times.map {
               Wheel.new
             }
         end
       end
       
       # SportsCar: inherited Car class; "<" means subset of..
       class SportsCar < Car
       end

     }.()

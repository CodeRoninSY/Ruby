#!/usr/bin/env ruby -w
#
# object_model.rb
#
# Dev: CodeRoninSY
# Date: 2020-12-24
#
# Youtube: https://www.youtube.com/watch?v=X2sgQ38UDVY
# Ruby object model by Dave Thomas
#
# self:
# ..
# object -> contains state and behaviors, behavior -> class methods, i.e. obj.methods
#
# Singleton class: eigenclass, metaclass

puts ->() {
       animal = "cat"

       def animal.speak # singleton_method
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

       p animal.methods
       p animal.is_a?(String)
       p animal.nil?
       p animal.tr("a-z", "a-r#*?/.:;+")

       animal.each_char do |c|
         printf("%s ", c)
       end
     }.()

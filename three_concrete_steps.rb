#!/usr/bin/env ruby -w
#
# three_concrete_steps.rb
# -------------------------------------------------------------------
# Dev: CodeRoninSY
# Date: 2020-12-31
# -------------------------------------------------------------------
# Synopsis: The three concrete steps
#
# RubyConf 2019
#
# RubyConf 2019 - Conscious Coding Practice: The Three Concrete Steps by Noah Gibbs
# Youtube: https://www.youtube.com/watch?v=33fAzjOTaDE
# Good coding style & good talk on Ruby
# Noah Gibbs' github: https://github.com/noahgibbs
#
#
# Seven guidelines (but no rules!)
#
# 1: Choose first and write
# that is:
# choose your tool, task and purpose first, before you begin coding.
# write them out in words.
#
# 2. Time limit
# choose a time limit. if you're not done by then, stop.
# if broken: long failures where you don't learn much and long 'successes' where
# you keep building but stop learning.
#
# 3: Throw it away
# when you've finished the exercise, don't use it for anything else.
# you're not producing a finished product.
# If broken: over-engineered prototype that teach you less and take longer
# to produce; you start building to use, not to learn.
#
# 4. One Idea at once
# your purpose is the idea you're studying. you want it to be
# one idea big, no more.
# If broken: your studies take much longer to get started;
# feature creep; hard to finish.
#
# 5: Simple, with Layers
# Start your code very simply and build up in layers. Debug
# statements help, too. Since you're doing development from
# scratch on each study, get the benefits of starting from scratch.
# If broken: long startup for each study; dread of starting;
# less writing, more debugging.
#
# 6: Work from Life
# Look at a real system in the real world. Staring at real
# complexity and letting it surprise you is the hidden purpose here.
# If broken: you only refine what you already know instead of learning
# something nobody (yet) knows; you lose your best cheat.
#
# 7: Break Rules
# Nothing is set in stone here. Break all these rules when it
# makes sense. Or just to see what happens!. (Or un-break!)
# This is play, not work. Break every rule that gets in the way
# of learning. Or playing!
#
# Pair coding:
# Pair on defining the task and purpose, not just writing the code
# Start "flat-footed," don't bring in a fully-developed idea
# Brainstorm together before typing
# One person on the keyboard at once
# Do something small; then swap roles and continue or restart.
#
# Don't be afraid of doing the things over and over.
# Artists repeat things over and over to excel.
# Steal relentlessly, copy their techniques and recreate it.
#

puts ->() {
       # first half
       kids = [15, 12, 11, 5, 4, 3]
       kids = kids.map { |age|
         {
           age: age,
           push: 3 * (age - 3),
           weight: 5 * Math.sqrt(age),
           cling: 4 * (age - 2)
         }
       }

       # second half
       speed = 0
       loop do
         oomph = kids.map { |k| k[:push] }.sum
         weight = kids.map { |k| k[:weight] }.sum
         speed += oomph.to_f / weight
         if speed > kids[-1][:cling]
           puts "#{kids.size} little monkeys, on the merry-go-round..."
           puts "#{kids[-1][:age]} fell off and bumped his head"
           kids.pop
           if kids.size.zero?
             puts 'No more monkeys on the merry-go-round!'
             break
           end
         end
       end

       # object oriented design for Kid class
       class Kid
         attr_reader :push, :weight, :cling

         def initialize(age)
           @age = age
           @weight = 5 * Math.sqrt(age)
           @push = 3 * (age - 3)
           @cling = 4 * (age - 2)
         end
       end

       # MerryGoRound
       class MerryGoRound
         def initialize(kids)
           # kids merry-go-round..
         end
       end
     }.()

#!/usr/bin/env ruby -w
#
# extreme_OO_ruby.rb
#
# -------------------------------------------------------------------
# Dev: CodeRoninSY
# Date: 2020-01-01
# -------------------------------------------------------------------
# Synopsis: Extreme object oriented Ruby
#
# Full Stack Fest 2015: Extreme Object-Oriented Ruby, by John Cinnamond
# https://www.youtube.com/watch?v=FDs-sSxo2iY
# Good talk on Programming and OO in Ruby
#
# https://github.com/jcinnamond
#
# Reference book: Understanding Computation by Tom Stuart
#
# Take ideas, turn them into code, type them in
#
# "...that a few fundamental relations being true,
# certain other combinations of relations must of
# necessity follow;
# combinations unlimited in variety and extent."
# -- Ada Lovelace, 1842

puts ->() {
       class If
         def initialize(cond)
           @cond = cond
         end

         def then(value)
           @cond.then(value)
         end
       end

       # Booleans implement
       class TrueResult
         def initialize(value)
           @value = value
         end

         def else(_)
           @value
         end
       end

       # True as a new object class
       class True
         def then(value)
           TrueResult.new(value)
         end

         def inspect
           "<true>"
         end
       end

       # False as a new object class
       class FalseResult
         def else(value)
           value
         end
       end

       class False
         def then(_)
           FalseResult.new
         end

         def inspect
           "<false>"
         end
       end

       # LessThanZero
       class LessThanZero
         def zero?
           False.new
         end

         def pred
           self
         end
       end

       # NumberZero
       class NumberZero
         def succ
           Number.new(self)
         end

         def pred
           LessThanZero.new
         end

         def +(other)
           other
         end

         def ==(other)
           other.zero?
         end

         def zero?
           True.new
         end

         def inspect
           "<zero>"
         end
       end

       # Number
       class Number
         attr_reader :pred

         def initialize(pred)
           @pred = pred
         end

         def succ
           Number.new(self)
         end

         def zero?
           False.new
         end

         def +(other)
           (@pred + other).succ
         end

         def ==(other)
           @pred == other.pred
         end

         def inspect
           @pred.inspect + "-"
         end
       end

       Zero = NumberZero.new
       p Zero
       One = Zero.succ
       p One
       Two = One.succ
       p Two
       Three = Two.succ
       Four = Three.succ

       p Zero + Zero
       p Zero + One
       p Zero + Two

       p One + Two
       p Two + Two

       p Zero == Zero
       p Zero == One

       p One == One
       p One == Two

       p One == Zero
       p Two == One
       p Four == One

       p One + One == Two

       result = If.new(False.new)
         .then(One)
         .else(Two)

       p result

       threat_level = 1
       action = if threat_level == 4
           launch_nuclear_missile
         else
           :no_action
         end
       p action

       # pure Object-oriented approach
       class Option1
         def result
           NuclearMissile.new.launch
         end
       end

       class Option2
         def result
           NoAction.new
         end
       end

       class NoAction
         def inspect
           "<no_action>"
         end
       end

       threat_level = One
       action = If.new(threat_level == Four)
         .then(Option1.new)
         .else(Option2.new)

       p action

       ## Lambda Calculus
       # lambda abstractions
       # id = \lambda(x).x
       #
       def id(x)
         x
       end

       class Id
         def call(x)
           x
         end
       end

       # true = \lambda(t).\lambda(f).t
       class True
         def call(t)
           Class.new do
             def initialize(t)
               @t = t
             end

             def call(f)
               @t
             end
           end.new(t)
         end
       end

       p True.new.call(:t).call(:f)
     }.()

#!/usr/bin/env ruby -w
#
# investigative_metaprogramming.rb
# -------------------------------------------------------------------
# Dev: CodeRoninSY
# Date: 2020-12-31
# -------------------------------------------------------------------
# Synopsis: Investigative Metaprogramming
# * what is Metaprogramming?
# 1. [academic]: Code that modifies the structure of the program,
# or determines the method to be invoked, at runtime.
# 2. [pragmatic]: Code I can't use full-text search on.
# call -> in fact it is a 'send' in ruby; call is a syntactic sugar.
#
# [1] assumes:
#   * "structure" is a different kind of thing than "data" or "computations."
#   * structure definition is a different phase of the program than runtime.
#   In Ruby, neither of these assumptions holds true.
# B.H. update on [1] -> "Code that treats (what we think of as) 'structure'
# (because that's how other languages go) the same way that it treats 'data'
# or 'functions'."
# [2] -> this is a feeling.
#
#
# Youtube talk: https://www.youtube.com/watch?v=bJMzWumXPmo
# RubyConf 2019 - Investigative Metaprogramming by Betsy Haibel
#

puts ->() {
       # module DebugFreezes
       module DebugFreezes
         # add telemetry
         def freeze(*)
           @freeze_context = caller
           super
         end

         # observe relevant data
         def []=(*)
           super
         rescue RunTimeError => e
           puts @freeze_context
           raise e
         end
       end

       Hash.prepend DebugFreezes

       # ...isn't this all runtime anyway? BH: a big mash, happening together
       class Yarn
         # getter
         def length
           @length
         end

         #setter
         def length=(new_length)
           @length = new_length
         end

         def scratchiness
           :scratchiness
         end
       end

       # class WoolYarn
       class WoolYarn < Yarn
         def scratchiness
           0.88
         end
       end

       # class Fiber
       class Fiber
         def scratchiness
           raise NotImplementedError
         end
       end

       # Reflection
       wy = WoolYarn.new

       p wy.class.ancestors

       p wy.class.ancestors
           .filter { |a|
           a.instance_methods
             .include?(:scratchiness)
         }

       # Recording
       value = "hi!"

       old_value = value
       trace = TracePoint.new(:line) do |tp|
         if value != old_value
           puts "value changed at: #{tp.path} line #{tp.lineno}"
         end
         old_value = value
       end

       trace.enable

       p trace.enabled?

       value = "bye!"
     }.()

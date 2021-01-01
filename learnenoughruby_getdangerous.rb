#!/usr/bin/env ruby -w
#
# learnenoughruby_getdangerous.rb
# -------------------------------------------------------------------
# Dev: CodeRoninSY
# Date: 2020-12-30
# -------------------------------------------------------------------
# Youtube talk: https://www.youtube.com/watch?v=NGXp6_-nc4s
# RubyConf 2019 - Learn Enough Ruby by Michael Hartl
# https://www.learnenough.com/ruby-tutorial/hello_world
# Michael Hartl's github: https://github.com/mhartl?tab=repositories
#
# How to use 'bundle' for creating gem set::
# Generate a gem bundle =>
# $> bundle gem rubyconf_palindrome
# Bundle generates a gem skeleton.
# Run a test on bundled test code:
# $> bundle exec rake test
#

puts -> {
       s = 'hello, world!'

       class String
         def palindrome?
           self == self.reverse
         end
       end

       puts "s.palindrome: #{s.palindrome?}"

       p = 'deified'
       puts "p.palindrome: #{p.palindrome?}"
     }.()

#!/usr/bin/env ruby -w
#
# dissect_ruby.rb
#
# Dev: CodeRoninSY
# Date: 2020-12-23
#
# Youtube: https://www.youtube.com/watch?v=nQ1XYwzaqck
# Pat Saughnessy - Ruby Conf 12 Dissecting a ruby block
#

puts ->() {
       10.times do |n|
         puts n
       end

       # class Quote
       class Quote
         def initialize
           @str = "The quick brown fox jumped over the lazy dog"
         end

         define_method :display_message do
           puts @str
         end
       end

       qu = Quote.new
       qu.display_message
     }.()

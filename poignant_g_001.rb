#!/usr/bin/env ruby
# poignant_g_001.rb
################################
# Author: CodeRoninSY
# Description: A quick ride through Ruby
# Copyright: None
# Date: 2020-11-18
# https://poignant.guide/book/chapter-1.html


# # 1
# 5.times{ print "odelay!" }

# # 2
# exit unless "restaurant".include? "aura"

# # 3
# ['toast', 'cheese', 'pizza'].each { |food| print food.capitalize }

# # 4
# require 'net/http'
# Net::HTTP.start('www.ruby-lang.org', 80) do |http|
#     print(http.get('/en/about/license.txt').body)
# end

# Chapter 4.4
kitty_toys = [
  {:shape => 'sock', :fabric => 'cashmere'},
  {:shape => 'mouse', :fabric => 'calico'},
  {:shape => 'eggroll', :fabric => 'chenille'}
]

kitty_toys.sort_by { |toy| toy[:shape] }.each do |toy|
      puts "Blixy has a #{ toy[:shape] } made of #{ toy[:fabric] }"
end

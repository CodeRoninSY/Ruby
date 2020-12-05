#!/usr/bin/env ruby -w
#
# optparse-test.rb
# Dev: CodeRoninSY
# Date: <2020-12-04>
#
require 'optparse'

options = {}

OptionParser.new do |opts|
  opts.on('-a')
  opts.on('-b NUM', Integer)
  opts.on('-m', '--move') { |o| options[:move] = o }
  opts.on('-v', '--[no-]verbose')
end.parse!(into: options)

p options

if ARGV.size < 2
  puts "Should use 2 args!"
  exit 1
end

from_name, to_name = ARGV

puts "Should move: #{ options.key?(:move) }"
puts "From: #{ from_name }"
puts "To: #{ to_name }"



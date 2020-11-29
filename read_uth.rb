#!/usr/bin/ruby -w
# read_uth.rb
#
# Dev: CodeRoninSY
# Date: 2020-11-25
#

#require 'csv'

if ARGV.length < 3
  puts "Too few args"
  puts ""
  puts "Usage: read_uth.rb FILE.uth c0 c1"
end

file = ARGV[0]
c0 = ARGV[1].to_i
c1 = ARGV[2].to_i
c2 = c1 + 1

vals = []
col0 = []
col1 = []
col2 = []
idx = 0

#puts file, c0, c1, c2

File.open(file).each_line do |line|
  line.chomp!
  next if line.empty?
  next if line.start_with? '$','#','MSDN','TIME',/^S.*/

#  puts(idx, line)

  vals = line.split(' ')
#  p vals
  unless vals.empty?
    col0.push(vals[c0].to_f)
    col1.push(vals[c1].to_f)
    col2.push(vals[c2].to_f)
  end

  idx = idx + 1
end

printf("col1 --> %s\n", col1)
p col1, col1.length(), col1[0], col1[-1]


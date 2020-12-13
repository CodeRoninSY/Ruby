#!/usr/bin/ruby -w
# read_f50.rb
#
# Dev: CodeRoninSY
# Date: 2020-11-25
#

require 'optparse'

if ARGV.length < 1
  puts "Too few args"
  puts ""
  puts "Usage: read_f50.rb FILE.f50"
end

file = ARGV[0]

vals = []

File.open(file).each_line do |line|
  line.chomp!
  line.strip!
  next if line.empty?
  next if line.start_with? 'ELEM','MAX','MIN', /[[:space:]]+ELEM[[:space:]]+LOC .*/
  next if line.start_with? 'MAX', /[[:space:]]+MAX [[:space:]]+ .*/
  next if line.start_with? 'MIN', /[[:space:]]+MIN .*/
  next if line.start_with? /[[:space:]]*SURF STRESS .*/
  next if line.start_with? /[[:space:]]+MAX STRESS .*/

#  p line
  vals.append(line)


end

vals.shift(3)
p vals

b1 = vals.take(2)

p b1

vals.each do |l|
  l.strip!

  m = /^SURF[[:space:]]+(?<el>.*$)/.match(l)
  puts(/^SURF[[:space:]]+(?<el>.*$)/.match(l))
  p m
  /^SURF[[:space:]]+(?<el>.*$)/ =~ l
  print(el,"\n")
  eh = el.to_s.split(/[[:space:]]+/)
  p eh
end

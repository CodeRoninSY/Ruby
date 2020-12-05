#!/usr/bin/env ruby -w
# read_csv_data.rb
# Dev: CodeRoninSY
# Date: <2020-12-02>
#
require 'optparse'
require 'csv'

# Dev settings
__author__ = 'CodeRoninSY'

# Case settings
__fprefx__ = "syPE496_hptr_2D_V1_"
__fsufx__  = "_mu045_1stC_pg.rst.gz"

# OptionParser
options = {}

OptionParser.new do |opts|
  opts.on('-f', '--file') { |o| options[:file] = o }
  opts.on('-v', '--[no-]verbose')
end.parse!(into: options)

#p options

if ARGV.length < 1
  puts "Too few arguments"
  puts ""
  puts "Usage: read_csv_data.rb FILE.csv"
  puts ""
end

#p ARGV

fileName = ARGV[0]

puts "Filename?: #{ options.key?(:file) }"

f = File.new(File.basename(fileName, ".*") + ".txt", "w")

tm = Time.now.strftime("<%Y-%m-%d> %G-W%V")

titleHeader = <<-END_STR
$ SY Performance Engine Data Write
$ .....
$ HeatTransfer file : ht_sype_v1.47
$ Dev: #{__author__}
$ Date: #{tm}
END_STR

f.write(titleHeader)

## read from a _data.csv file naming tweaks
f.write("LN\tTM\tFileName\tTIME\n")

File.open(fileName).each_line do |line|
  line.chomp!
  ln = "1\t" + line.to_s + "  \t#{__fprefx__}" + line.to_s + "#{__fsufx__}\tTIME=" + line.to_s
  f.printf("%s\n", ln)
end



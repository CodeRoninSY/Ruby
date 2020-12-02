#!/usr/bin/env ruby -w
# read_csv_data.rb
# Dev: CodeRoninSY
# Date: <2020-12-02>
#

require 'csv'

if ARGV.length < 1
  puts "Too fwe arguments"
  puts ""
  puts "Usage: read_csv_data.rb FILE.csv"
  puts ""
end

fileName = ARGV[0]

f = File.new(File.basename(fileName, ".*") + ".txt", "w")

titleHeader = <<-END_STR
$ SY Performance Engine Data Write
$ Comment line
$ HeatTransfer file : ht_sype_v1.47
$ .....
END_STR

f.write(titleHeader)

## read from a _data.csv file naming tweaks
f.write("LN\tTM\tFileName\tTIME\n")

File.open(fileName).each_line do |line|
  line.chomp!
  ln = "1\t" + line.to_s + "    \tsype1200_hptr_2D_b1DDR_" + line.to_s + "_mu045_1stC_pg.rst.gz\tTIME=" + line.to_s
  f.printf("%s\n", ln)
end



#!/usr/bin/env ruby
# csv_read.rb
################################
# Dev: CodeRoninSY
# Date: <2020-11-17>
################################
require 'csv'

module MyTable
    @table_fruit = {}
    @table_price = {}
    @vals = []
    CSV.foreach("csv_file.csv") do |row|
        vals = row
        next if vals[0] == "id"
        @table_fruit[vals[0]] = vals[1]
        @table_price[vals[0]] = vals[2]
    end

    puts "Now we have this fruit hash: " + @table_fruit.inspect
    puts "Also we have this price hash: " + @table_price.inspect

    def self.fruit(vals)
        @table_fruit[vals[0]]
    end

    def self.price(vals)
        @table_price[vals[0]]
    end

end

puts "Name of Fruit: " + MyTable.fruit("1")
puts "Value of Price: " + MyTable.price("1")



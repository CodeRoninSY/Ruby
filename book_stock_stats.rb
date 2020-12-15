#!/usr/bin/env ruby -w
################################
# book_stock_stats.rb
################################
# Dev: CodeRoninSY
# Date: <2020-12-14>
#
# Usage: book_stock_stats.rb bookdata.csv

require_relative 'book_csv_reader'

reader = CsvReader.new

ARGV.each do |csv_file_name|
    STDERR.puts "Processing \"#{csv_file_name}\""
    reader.read_in_csv_data(csv_file_name)
end

puts "Total value = #{reader.total_value_in_stock}"

# p reader.methods
# p reader.total_value_in_stock
# p reader.number_of_each_isbn
p reader.instance_variables
p reader.instance_variable_get(:@books_in_stock)

reader.instance_variable_get(:@books_in_stock).each do |book|
    printf("ISBN: %s, Price: %.2f\n",
        book.instance_variable_get(:@isbn),
        book.instance_variable_get(:@price))
end

file = File.open("users.txt")

# file_data = file.read
# puts file_data

file_data = file.readlines.map(&:chomp)
file.close
puts file_data

# read file line by line
File.foreach("users.txt") { |line| puts line }
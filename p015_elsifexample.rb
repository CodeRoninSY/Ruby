# Further modified
puts "Hello, what's your name?"
STDOUT.flush
name = gets.chomp
puts 'Hello, ' + name + '.'

# || is the logical or operator
if name == 'CodeRonin' || name == 'CodeRoninSY' || name == 'SY'
  puts "What a nice name, #{name}!!"
end

# p003rubystrings.rb
=begin
  Ruby Strings
  In Ruby, strings are, by default, mutable
=end

puts "Hello World"
# Can use " or ' for Strings, but ' is more efficient
puts 'Hello World'
# String concatenation
puts 'I like' + ' Ruby'
# Escape sequence
puts 'It\'s my Ruby'
# New here, displays the string three times
puts 'Hello' * 3
# Defining a constant
# More on Constants later, here
# /satishtalim/ruby_names.html
PI = 3.141592654
puts PI

# heredoc example
type = "healthy"
table = "food"

query = <<-SQL
SELECT * FROM #{table}
WHERE #{type} = true
SQL

puts query
print "hello world\n" * 3

# command output
_Date = `date +%s`
print "#{_Date}\n"

cwd = `pwd`
lsf =  `ls -la`
print "Folder list:\n#{cwd}\n#{lsf}"
# spawn a separate process to use kernel method 'system'
RetrnVal = system("ls -la --color")
if RetrnVal == true
    puts "Success::0"
else
    puts RetrnVal
end

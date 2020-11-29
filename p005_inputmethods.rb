# p005methods.rb
# gets and chomp
puts '[c*]'*12
puts "In which city do you stay?"
STDOUT.flush
city = gets.chomp
puts "The stellar city is " + city

system("clear")

pp = []

puts "Parameters>> "
STDOUT.flush
parm = gets.chomp
prm = parm.split(/[\s+,;:]/)
prm.each do |p|
  unless p.empty?
    pp.push(p.strip().to_i)
  end
end

printf("Params >>: %s, len: %d\n", prm, prm.length())

p pp

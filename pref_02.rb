#!/usr/bin/env ruby -w
# pref_02.rb
# Dev: CodeRoninSY
# Date: <2020-11-29>
#
ruby = "nifty"
programming = "fun"
weather = "nice"

if ruby == "nifty" && programming == "fun"
  puts "Keep programming!"
end

a = 10
b = 27
c = 43
d = -14

if a == 10 && b == 27 && c == 43 && d == -14
  sum = a + b + c + d
  printf("Sum = %d\n", sum)
end

if ruby=="nifty" and programming=="fun" and
weather=="nice"
  puts "Stop programming and go outside for a break!"
end

if a == 10 || b == 27 || c = 43 || d = -14
  sum = a + b + c + d
  printf("Sum = %d\n", sum)
end

if ruby == "nifty" or programming == "fun"
  puts "Keep programming!"
end


# elsif example
puts "Language code: "
STDOUT.flush
lang = gets.chomp

if lang =~ /[Ee]n/
    puts "dog"
  elsif lang =~ /[Ee]s/
    puts "perro"
  elsif lang =~ /[Ff]r/
    puts "chien"
  elsif lang =~ /[Dd]e/
    puts "Hund"
  elsif lang =~ /[Tt]r/
    puts "köpek"
  else
    puts "No language set; default = 'dog'"
end


# while
i = 0
breeds = [ "quarter", "arabian", "appalosa", "paint" ]
puts "breeds.size = #{breeds.size} "
temp = []

while i < breeds.size do
  temp << breeds[i].capitalize
  i += 1
end

temp.sort!
breeds.replace( temp )
p breeds


# for loop
for i in 1..12
  print "2 x " + i.to_s + " = ", i*2, "\n"
end


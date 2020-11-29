# p007dt.rb
# Ruby is dynamic
x = 7           # integer
x = "house"  # string
x = 7.5        # real

# In Ruby, everything you manipulate is an object
print 'I love Ruby!'.delete(' ').length, " characters!\n"
# delete() is the fastest
print 'I love Ruby!'.gsub(/[[:space:]]/, ''), "\n"
# split join
print 'I love Ruby!
   I love Ruvy!'.gsub(/\s+/, ""), "\n"

print 'I love Ruby!
   I love Ruvy!'.split.join, "\n"

print 'I love Ruby!
   I love Ruvy!'.tr(" \n\t", ""), "\n"

print 'I love Ruby!
   I love Ruvy!'.tr("\n","").delete("\s+"), "\n"

# nice example
rice_on_square = 1
64.times do |square|
  puts "On square #{square + 1} are #{rice_on_square} grain(s)"
  rice_on_square *= 2
end

iCounter = 1
10.times do |n|
    puts "n:: #{n} => #{iCounter}"
    iCounter += 1
end

# data types
puts iCounter.class

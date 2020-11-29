#!/usr/bin/env ruby -w
# pref_01.rb
# From Ruby Pocket Reference
# Dev: CodeRoninSY
# Date: <2020-11-29>
#
class Name
 def family_name=( family )
    @family_name = family
 end
 def given_name=( given )
    @given_name = given
 end

 def mid_name=( mid )
   @mid_name = mid
 end

end

n = Name.new
n.family_name= "Matsumoto" # => "Matsumoto"
n.given_name= "Yukihiro" # => "Yukihiro"
n.mid_name= "Matz"
p n

# variable args
def num_args( *args )
  length = args.size
  label = length == 1 ? " argument" : " arguments"
  num = length.to_s + label + " ( " + args.inspect + " )"
  num
end

puts num_args
puts num_args(1)
puts num_args(100, 2.5, "three")

# yield statement - block_given? is from Kernel method
# yield should execute a block
#
def gimme
  if block_given?
    yield
  else
    puts "I'm blockless!"
  end
end

gimme { print "Say hi to the people." }
gimme

# Proc calls
count = Proc.new { [1,2,3,4,5].each do |i| print i end; puts }

your_proc = lambda { puts "Lurch: 'You rang?'" }

my_proc = proc { puts "Morticia: 'Who was at the door, Lurch?'" }

puts "Proc classes= ", count.class, your_proc.class, my_proc.class

count.call
your_proc.call
my_proc.call


# pass a method as argument '&'
def return_block
  yield
end

def return_proc( &proc )
  yield
end

return_block { puts "Got block!" }
return_proc { puts "Got block, convert to proc!" }



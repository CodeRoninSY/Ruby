#!/usr/bin/env ruby -w
#
# intro_block.rb
# Dev: CodeRoninSY
# Date: 2020-12-20
#
# Pensèe (meditations) on proc, lambda, closures

def run_block
    yield if block_given?
end

run_block # does not yield anything, no block given

# Array class - meditations on block call using yield
class Array
    def random_each
        shuffle.each do |el|
            yield el
        end
    end
end

puts 'Range limit? <int>'
STDOUT.flush
INPUT = gets.chomp.to_i

a = (1..INPUT).to_a
p a

a.random_each do |el|
    puts el
end

# redefining of random_each with proc object
class Array
    def random_each(&b)
        p b
        shuffle.each do |el|
            b.call el
        end
    end
end

a.random_each do |el|
    puts el
end

# passing 2 procs
def run_two_procs(a, b)
    a.call
    b.call
end

proc1 = Proc.new do
    puts "Proc1"
end

proc2 = Proc.new do
    puts "Proc2"
end

run_two_procs proc1, proc2

# another method to call proc
def run_block
    p = Proc.new
    p.call
end

run_block do
    puts "Ciao Mondo!"
end

# hash
h = Hash.new(0)
h = { 1 => '1', 2 => '2', 3 => '3'}

# proc call types - 4 different call
my_proc = Proc.new do |a|
    puts "This is my proc and #{a} was passed to me"
end
# call style 1
my_proc.call(h)
# call style 2
my_proc.(a.append(42))
# call style 3
my_proc[30]
# call style 4 - === case statement
my_proc === 42

# proc examples - abstracting an equality
several = Proc.new { |number| number > 3 && number < 8 }
many = Proc.new { |number| number > 3 && number < 8 }
few = Proc.new { |number| number == 3 }
couple = Proc.new { |number| number == 2 }
none = Proc.new { |number| number == 0 }

0.upto(10) do |number|
    print "#{number} item is "
    case number # behind -> e.g. 5 === number
    when several # several === number -> calls proc.several
        puts "several"
    when many
        puts "many"
    when few
        puts "few"
    when couple
        puts "couple"
    when none
        puts "none at all"
    else
        puts "awesome"
    end
end


# lambda - enforces arity, whereas proc does not enforce arg arity
hello = lambda do |a, b, c|
    puts "this is lambda"
end

hello.call(a, h, 42) # if not given 3 args gives an ArgumentError because lambda requires 3 args


# lambda vs proc
# return in proc tries to return from where the context is defined..
# ... not from currently running
def run_a_proc(p)
    puts "Starting to run a proc"
    p.call
    puts "Finished running the proc"
end

run_a_proc lambda { puts "I'm a lambda"; return }

# run_a_proc proc { puts "I'm a proc"; return } # proc then return is causing to return from namespace, so code couldn't go on to execute after this proc;return cal

# closures - ruby does not store values like other languages
# ruby stores references to variables
def multiple_generator(m)
    lambda do |n|
        n * m
    end
end

doubler = multiple_generator(2)
tripler = multiple_generator(3)

puts doubler[5] # also doubler.(5)
puts tripler[10] # also tripler.(10)

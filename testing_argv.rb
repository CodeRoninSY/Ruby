if ARGV.length < 2
    puts "Too few arguments"
    exit
end

for i in 0 ... ARGV.length
    puts "#{i} #{ARGV[i]}"
end

# methods
def multiply(v1, v2)
    result = v1 * v2
    return result
end

value = multiply(10, 20)

puts value

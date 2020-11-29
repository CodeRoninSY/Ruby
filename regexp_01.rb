#!/usr/bin/ruby -w
# https://docs.ruby-lang.org/en/2.6.0/doc/regexp_rdoc.html

puts(/hay/ =~ 'haystack')
puts(/[0-9a-f]/.match('9f'))
puts(/[9f]/.match('9f'))

puts("Hello, brave new world!".match(/[[:upper:]]+[[:lower:]]+l{2}o[,.;].+\s+\w+[[:punct:]]/))

# capturing ()
puts(/\$(?<dollars>\d+)\.(?<cents>\d+)/.match("$3.67"))
puts(/\$(?<dollars>\d+)\.(?<cents>\d+)/.match("$3.67")[:dollars])

/\$(?<dollars>\d+)\.(?<cents>\d+)/ =~ "$3.67"
print(dollars, "$.", cents, "c\n")

m = /s(\w{2}).*(c)/.match('haystack')

p $~
p Regexp.last_match

p $&
p m[0]

p $`
p m.pre_match

p $'
p m.post_match

p $1
p m[1]

p $2
p m[2]



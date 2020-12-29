#!/usr/bin/ruby -w
#
# regexp_01.rb
#
# https://docs.ruby-lang.org/en/2.6.0/doc/regexp_rdoc.html
#
# Dev: CodeRoninSY
# Date: 2020-12-25
#
# Youtube: https://www.youtube.com/watch?v=JfwS4ibJFDw&list=PLE7tQUdRKcyYCsMvCcskeBe9DkSSt0oR2&index=19
# RubyConf2013
# Nell Shamrell: https://github.com/nellshamrell
#
# Finite State Machine shows how something works
#
# Develop regular expressions in small pieces; e.g. see https://rubular.com/
#
# Move beyond the fear
#

puts ->() {
       puts(/hay/ =~ "haystack")
       puts(/[0-9a-f]/.match("9f"))
       puts(/[9f]/.match("9f"))

       puts("Hello, brave new world!".match(/[[:upper:]]+[[:lower:]]+l{2}o[,.;].+\s+\w+[[:punct:]]/))

       # capturing ()
       puts(/\$(?<dollars>\d+)\.(?<cents>\d+)/.match("$3.67"))
       puts(/\$(?<dollars>\d+)\.(?<cents>\d+)/.match("$3.67")[:dollars])

       /\$(?<dollars>\d+)\.(?<cents>\d+)/ =~ "$3.67"
       print(dollars, "$.", cents, "c\n")

       m = /s(\w{2}).*(c)/.match("haystack")

       puts "Regexp last match:"
       p $~
       p Regexp.last_match

       puts "Regexp_last_match(0): "
       p $&
       p m[0]

       puts "Regexp.last_match.pre_match: "
       p $`
       p m.pre_match

       puts "Regexp.last_match.post_match: "
       p $'
       p m.post_match

       puts "Regexp.last_match(1):"
       p $1
       p Regexp.last_match(1)
       p m[1]

       puts "Regexp.last_match(2):"
       p $2
       p m[2]

       # let's go back to conf examples:
       re = /force/
       string = "Use the force, may the force be with you"
       re.match(string)
       p Regexp.last_match

       re = /Y(olk|oda)/
       string = "Yoda"
       re.match(string)
       p Regexp.last_match

       # quantifiers; ('+' is greedy)
       re = /No+/
       string = "Nooooo"
       re.match(string)
       p Regexp.last_match

       # lazy quantifiers; match least possible
       re = /No+?/
       string = "Nooooo"
       re.match(string)
       p Regexp.last_match

       # star quantifier
       re = /.*moon/
       string = "That's no moon"
       re.match(string)
       p Regexp.last_match

       #
       re = /No+w+/
       string = "Noooo"
       re.match(string)
       p Regexp.last_match

       # Possessive quantifiers - do not backtrack
       # possessive quantifiers fail faster by controlling backtracking; use with caution
       # e.g. 2nd '+' is possessive
       re = /No++w+/
       string = "Noooo"
       re.match(string)
       p Regexp.last_match

       # e.g. snake_case to CamelCase
       # * find first letter of string and capitalize it
       # * find any character that follows an underscore and capitalize it
       # * remove underscores

       class CaseConverter
         def upcase_chars(string)
           re = /\A_?[a-z]|(?<=_)[a-z]/
           string.gsub(re) { |char| char.upcase }
         end

         def remove_underscores(string)
           re = /_/
           string.gsub(re, "")
         end

         def snake_to_camel(string)
           remove_underscores(upcase_chars(string))
         end
       end
     }.()

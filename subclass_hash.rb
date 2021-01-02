#!/usr/bin/env ruby -w
#
# subclass_hash.rb
#
# -------------------------------------------------------------------
# Dev: CodeRoninSY
# Date: 2021-01-01
# -------------------------------------------------------------------
# Synopsis: Let's subclass Hash
#
# RubyConf 2018 - Let's subclass Hash - what's the worst that could happen? by Michael Herold
# https://www.youtube.com/watch?v=KzdSxgVPhXU
#
# Michael Herold's github: https://github.com/michaelherold
#
# https://code.dblock.org/2017/02/24/the-demonic-possession-of-hashie-mash.html
#
require "hashie"
require "json"
require "ostruct"

puts ->() {
       class Person < Hashie::Trash
         include Hashie::Extensions::IgnoreUndeclared
         property :first_name
         property :last_name
       end

       user_data = {
         first_name: "Freddy",
         last_name: "Nostrils",
         email: "freddy@example.com",
       }

       p = Person.new(user_data) # 'email' is silently ignored

       p.first_name # => 'Freddy'
       p.last_name  # => 'Nostrils'
       # p.email      # => NoMethodError

       class MyHash < Hashie::Hash
         include Hashie::Extensions::MergeInitializer
         include Hashie::Extensions::IndifferentAccess
       end

       hash = MyHash.new(
         cat: "meow",
         "dog" => { name: "Mango", sound: "woof" },
       )

       p hash[:dog]
       p hash
       p hash.class

       new_dog = hash[:dog].merge(breed: "Blue Heeler")
       puts "new_dog: #{new_dog}"

       # mash is a hash, so it could conflict with previous hash methods!
       # e.g. .zip method is Enumerable#zip
       # how can we overcome this?
       # we create a zip override and make original zip an alias
       # N.B. don't do this in production, this overrides mash the method cache!
       class MyMash < Hashie::Mash
         include Hashie::Extensions::MethodAccessWithOverride
       end

       mash = MyMash.new
       mash.awesome = "sauce"
       p mash["awesome"]
       mash.zip = "a-dee-doo-dah"
       p mash.zip
       # we have defined an alias for #zip method
       # you can still access Enumerable#zip alias via:
       p mash.__zip

       # dash => declarative hash
       class PersonHash < Hashie::Dash
         property :name
         property :nickname
       end

       # PersonHash.new(foo: 'bar') # => error: foo is not defined for PersonHash

       sam = PersonHash.new(name: "Samwise", nickname: "Sam")

       result = { **sam, height: "1.66m" }
       p "result: #{result}\n"

       # how to access height:?
       result = { **sam.to_h, height: "1.66m" }[:height]
       p result

       # what's happening here?
       class Test
         def to_hash
           { foo: "bar" }
         end
       end

       result = { **Test.new, baz: "quux" }

       p result

       # what happens when we double-splat inside a Hash literal?
       puts RubyVM::InstructionSequence.compile(
         "{ **sam, height: '1.66m' }"
       ).disasm

       # So, to recap:
       # 1. IndifferentAccess
       # 2. Mash keys
       # 3. Destructuring a Dash
       # root cause => class MyHash < Hash
       # many of the hash methods are implemented in C, so RubyVM does not fix it
       # you need to know what you're doing...

       # you might not need Hashie::Mash
       json = JSON.parse(<<JSON)
{
  "foo": "bar",
  "bazes": [
    "baz",
    "quux"
  ]
}
JSON

       parsed = Hashie::Mash.new(json, object_class: OpenStruct)

       puts "parsed: #{parsed}\n"

       puts "foo: #{parsed.foo}\n"
       puts "foo: #{parsed["foo"]}"
       puts "foo: #{parsed[:foo]}"
       puts "bazes: #{parsed.bazes}"

       json = JSON.parse(<<JSON)
{
  "foo": "bar",
  "bazes": [
    "baz",
    "quux"
  ]
}
JSON

       puts "json: #{json}\n\n"

       parsed = JSON.generate(json, object_class: OpenStruct)
       p parsed
       puts "foo: #{parsed.foo}\n"

       puts
     }.()

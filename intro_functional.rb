#!/usr/bin/env ruby -w
#
# intro_functional.rb
# -------------------------------------------------------------------
# Dev: CodeRoninSY
# Date: 2020-12-20
#
# Examples from Ruby Conf 2012 - Talk by Jim Weirich
# https://www.youtube.com/watch?v=FITJMJjASUs
# Y not - adventures in functional programming
# Excellent talk on functional programming in Ruby
# -------------------------------------------------------------------

puts ->() { # subtle way of using 'puts' method; just prints the last evaluated expression

       # the problem
       # fact = ->(n) { n.zero? ? 1 : n * fact.(n-1) }
       # fact.(5) # this runs without error

       # ->(n) { n.zero? ? 1 : n * fact.(n-1)}.(5) # gives error, requires explicit lambda func name!

       # fixpoints
       # higher order functions
       # functional refactorings
       # (1) Tennent Correspondence Principle
       # (2) Introduce Binding
       # (3) wrap function
       # (4) Inline definition

       make_adder = ->(x) {
         ->(v) { ->(n) { n + x }.(v) } # (3) wrap func using arbtray v variable
       } # higher order func -> returns func

       compose = ->(f, g) {
         ->() { ->(n) { f.(g.(n)) } }.()
       } # higher order func -> takes funcs as args

       add1 = make_adder.(1)

       # N.B. add1 is changed for (4)
       # redefined 'make_adder' so that we make it inline and refactored
       # now no need a "make_adder" for add1
       add1 = ->(x) {
         ->(v) { ->(n) { n + x }.(v) }
       }.(1)

       mul3 = ->(n) { ->(z) { n * 3 }.(42) } # (1) & (2) = (42 === z) but does not matter what value is given

       mul3add1 = compose.(mul3, add1)

       mul3add1.(10)

       # yet another binding for "pure lambda calculus"!
       ->(f, g) {
         ->(xyz) { ->(n) { f.(g.(n)) } }.(42)
       }.(->(n) { ->(z) { n * 3 }.(42) }, ->(x) {
         ->(v) { ->(n) { n + x }.(v) }
       }.(1)).(10) # not easy to read and follow!

       # Recursion - factorial lambda function
       # gen -> generator function generates recursively
       fx = ->(gen) {
         gen.(gen)
       }.(
         ->(gen) {
           ->() {
             ->(n) { n.zero? ? 1 : n * gen.(gen).(n - 1) }
           }.()
         }
       )

       fx.(20)

       # another binding for factorial
       ->(improver) {
         ->(gen) {
           gen.(gen)
         }.(
           ->(gen) {
             improver.(->(v) { gen.(gen).(v) })
           }
         )
       }.(
         ->(partial) { # this part calculates the factorial
           ->(n) { n.zero? ? 1 : n * partial.(n - 1) }
         }
       ).(5)
     }.()

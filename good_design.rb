#!/usr/bin/env ruby -w
#
# good_design.rb
# -------------------------------------------------------------------
# Dev: CodeRoninSY
# Date: 2020-12-20
#
# Examples from LoneStarRuby - Talk by Dave Thomas
# Youtube: https://www.youtube.com/watch?v=yCBUsd52a3s
#
# A good design (and implementation) is easier to change than a bad design.
#
# * Listen to the code; when a code pushes back it warns you you do something wrong.
# * Design with data, code with transformations
# * Design with objetcs, not classes
# * Delete the tests
# * do nothing without feedback; break your big jobs into smaller ones
# * divide and conquer (design, achitecture)
# * write code in small chunks; one day rule? half day rule? any rule you can follow.
# * questions to ask:
#   - how much of this am I using?
#   - can I extract what I need?
# * the most powerful tool in your coding toolbox => trash bin!
#   - if you don't get it what you design, don't fight it, throw it away!
# * never call when you can send!
#   - decouple systems
# * mobile first -> accessible first
# * know your history
# * know a handful of useful data structures
#   - tries, hashes, linked lists, queues, skip lists, ring buffers, etc...
# * know a handful of useful algorithms
#   - something like 'eat your vegetables' :)
#   - quicksort, radix sorts, boyer-moore, rabin-karp, transitive closure,
#   - shortest path, topological sort, state machines/DFA, ...
# * Software has 14 year cycles. (?!). Each cycle repeats the mistakes of the previous cycles.
# * Avoid flow state; tacit knowledge - you can't do it in your programming
# * Contribute to open source; don't be a vampire
# * Don't love your tools. Love what they let you do.
# * Be thankful.
# * Don't forget to have fun!
#
#

      good_design = <<~MAKEITWORTH
# A good design (and implementation) is easier to change than a bad design.
#
# * Listen to the code; when a code pushes back it warns you you do something wrong.
# * Design with data, code with transformations
# * Design with objetcs, not classes
# * Delete the tests
# * do nothing without feedback; break your big jobs into smaller ones
# * divide and conquer (design, achitecture)
# * write code in small chunks; one day rule? half day rule? any rule you can follow.
# * questions to ask:
#   - how much of this am I using?
#   - can I extract what I need?
# * the most powerful tool in your coding toolbox => trash bin!
#   - if you don't get it what you design, don't fight it, throw it away!
# * never call when you can send!
#   - decouple systems
# * mobile first -> accessible first
# * know your history
# * know a handful of useful data structures
#   - tries, hashes, linked lists, queues, skip lists, ring buffers, etc...
# * know a handful of useful algorithms
#   - something like 'eat your vegetables' :)
#   - quicksort, radix sorts, boyer-moore, rabin-karp, transitive closure,
#   - shortest path, topological sort, state machines/DFA, ...
# * Software has 14 year cycles. (?!). Each cycle repeats the mistakes of the previous cycles.
# * Avoid flow state; tacit knowledge - you can't do it in your programming
# * Contribute to open source; don't be a vampire
# * Don't love your tools. Love what they let you do.
# * Be thankful.
# * Don't forget to have fun!
MAKEITWORTH

       p good_design

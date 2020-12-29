#!/usr/bin/env ruby -w
#
# algorithms_CLRS_ruby.rb
# -------------------------------------------------------------------
# Dev: CodeRoninSY
# Date: 2020-12-27
# -------------------------------------------------------------------
#
# Synopsis: Algorithms implementation in Ruby
#           Gem 'algorithms' has many sorting and other algorithms implemented.
#           selection_sort, insertion_sort, quicksort are manually implemented as well.
#
# -------------------------------------------------------------------
#
# Examples from Ruby Conf 2019 - Talk by Brad Grzesiak
# Youtube: https://www.youtube.com/watch?v=eJL0M7H-p-I
# Brad Grzesiak github page: https://github.com/listrophy
#
# =>Reference:
# 1. Introduction to Algorithms, Cormen, Leiserson, Rivest
# 2. Algorithms, Robert Segewick
# 3. 40 Algorithms every programmer should know, Imran Ahmad, PacktPub
#    github source: https://github.com/packtpublishing/40-algorithms-every-programmer-should-know
# -------------------------------------------------------------------
# Algorithms: a syllabus in this Ruby talk:
# * complexity (of algorithm) -> denoted by O(.)
# sorting algorithms =>
# - insertion sort => O(n^2)
# - quick sort => O(n log n)
# - bucket sort
# - longest common subsequence
# - minimum spanning tree
# - shortest path
# - max flow
#
# -------------------------------------------------------------------
# libraries required? not tested yet, though!
require "algorithms"
require "pqueue"
require "benchmark"
include Benchmark

puts ->() {

       # complexity O() -> O(1):ok  -- O(log n): a.bsearch <great> -- O(n): a.map <hmmm>

       # e.g. Data (before insertion sort)
       list = []
       20.times do
         list << rand(-100..100)
       end

       ary = list.clone
       orig_list = list.clone

       # Selection sorting; from Ref[2] "Algorithms" -> p.95
       # selection_sort(ary) => O(n^2)
       def selection_sort(list)
         (0...list.size - 1).each do |i|
           min = i
           (i + 1...list.size).each do |j|
             if list[j] < list[min]
               min = j
             end
           end
           temp = list[min]
           list[min] = list[i]
           list[i] = temp
         end
         list
       end

       puts "list: #{list}"
       puts "selection_sort[ary]= #{selection_sort(ary)}"

       # insertion sort - O(n^2) complexity
       def insertion_sort(list)
         return list if list.size < 2

         (1...list.length).each do |i|
           j = i - 1
           e_next = list[i]
           while j >= 0 and list[j] > e_next
             list[j + 1] = list[j]
             j -= 1
           end
           list[j + 1] = e_next
         end
         list
       end

       copyl = list.clone
       # now print out the sorted array and unsorted original array uniq els count
       puts "list:#{list}->\ninsertion_sort(copyl)= #{insertion_sort(copyl)}"

       # Quick sort - divide & conquer method - O(n log n) complexity
       def quicksort(ary)
         qsort_help(ary, 0, ary.length - 1)
         ary
       end

       def qsort_help(ary, p, r)
         return unless p < r

         q = partition(ary, p, r)
         qsort_help(ary, p, q - 1)
         qsort_help(ary, q + 1, r)
       end

       def partition(ary, p, r)
         x = ary[r]
         i = p - 1
         (p...r).each do |j|
           if ary[j] <= x
             i += 1
             swap(ary, i, j)
           end
         end
         swap(ary, i + 1, r)
         i + 1
       end

       def swap(ary, p, r)
         temp = ary[p]
         ary[p] = ary[r]
         ary[r] = temp
       end

       c = list.clone
       puts "c->clone(list): #{c}"
       puts "quicksort(c).inspect: #{quicksort(c).inspect}"

       # mergesort -> from 'algorithms' documentation
       def mergesort(container)
         return container if container.size <= 1

         mid = container.size / 2
         left = container[0...mid]
         right = container[mid...container.size]
         merge(mergesort(left), mergesort(right))
       end

       def merge(left, right)
         sorted = []
         until left.empty? or right.empty?
           left.first <= right.first ? sorted << left.shift : sorted << right.shift
         end
         sorted + left + right
       end

       dupl_list = list.clone
       puts "dupl_list:#{dupl_list}"
       puts "mergesort:#{mergesort(dupl_list)}"

       # Bucket Sort - O(n^2)
       def bucket_sort(ary, length)
         b = Array.new(length)
         mx = ary.max

         (0...length).each do |i|
           idx = length * (ary[i] / mx)
           b[idx] ||= []
           b[idx] << ary[i]
         end

         b.each(&:insertion_sort!)
         replace(b.flatten.compact)
       end

       # d = c.dup
       # p d
       # p bucket_sort(c, c.length)

       # Dynamic Programming
       # longest common subsequence - generally used in matching DNA genes
       # or similar to github diff, file difference check, ....
       def lcs
         setup
         compute_matrix
         @matrix.last.last
       end

       def setup
         @matrix = Array.new(@a.length + 1) do
           Array.new(@b.length + 1, 0)
         end
       end

       def compute_matrix
         (1..(@a.length)).each do |i|
           (1..(@b.length)).each do |j|
             compute_cell(i, j)
           end
         end
       end

       def compute_cell(i, j)
         @matrix[i][j] = if @a[i - 1] == @b[j - 1]
             matches(i, j)
           else
             does_not_match(i, j)
           end
       end

       def matches(i, j)
         @matrix[i - 1][j - 1] + 1
       end

       def does_not_match(i, j)
         [@matrix[i - 1][j],
          @matrix[i][j - 1]].max
       end

       # Graphs ->
       # Minimum spanning Tree (Prim's Algorithm)

       # vertices.map { |u| u.key = Float::INFINITY }
       # queue = PQueue.new(vertices)
       #
       # until queue.empty?
       # u = queue.extract
       # u.neighbors.each do |v, w|
       # if queue.has?(v) && w < v.key
       # v.parent = u
       # v.key = w
       # end
       # end
       # end

       # From gem -> 'algorithms'
       # Algorithms::Sort.<X>
       c = orig_list.clone
       d = orig_list.clone
       e = orig_list.clone
       f = orig_list.clone
       g = orig_list.clone

       puts "C:#{c}->\ninsertion_sort:  #{Algorithms::Sort.insertion_sort(c)}"
       puts "D:#{d}->\nmerge_sort:      #{Algorithms::Sort.mergesort(d)}"
       puts "E:#{e}->\nquicksort:       #{Algorithms::Sort.quicksort(e)}"
       puts "F:#{f}->\nselection_sort:  #{Algorithms::Sort.selection_sort(f)}"
       puts "G:#{g}->\nshell_sort:      #{Algorithms::Sort.shell_sort(g)}"

       puts "orig_list: #{orig_list}"

       # Benchmarking for sorting algorithms
       array = []
       1_000.times { array.append(rand) }

       puts "\n\n"
       # puts "\narray: #{array}\n\n"

       Benchmark.bmbm do |x|
         x.report("Algorithms::Sort.selection_sort") { Algorithms::Sort.selection_sort(array.dup) }
         x.report("Algorithms::Sort.insertion_sort") { Algorithms::Sort.insertion_sort(array.dup) }
         x.report("Algorithms::Sort.mergesort") { Algorithms::Sort.mergesort(array.dup) }
         x.report("Algorithms::Sort.quicksort") { Algorithms::Sort.quicksort(array.dup) }
         x.report("Algorithms::Sort.shell_sort") { Algorithms::Sort.shell_sort(array.dup) }
         x.report("Algorithms::Sort.bubble_sort") { Algorithms::Sort.bubble_sort(array.dup) }
         x.report("Algorithms::Sort.comb_sort") { Algorithms::Sort.comb_sort(array.dup) }
         x.report("Algorithms::Sort.heapsort") { Algorithms::Sort.heapsort(array.dup) }
         x.report("selection_sort") { selection_sort(array.dup) }
         x.report("insertion_sort") { insertion_sort(array.dup) }
         x.report("quicksort") { quicksort(array.dup) }
       end

       puts
     }.()

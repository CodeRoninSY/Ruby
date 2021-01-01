#!/usr/bin/env ruby -w
#
# parallelruby_memorymonster.rb
# -------------------------------------------------------------------
# Dev: CodeRoninSY
# Date: 2020-12-31
# -------------------------------------------------------------------
# Synopsis: Parallel Ruby
#
# RubyConf 2019
# Youtube: https://www.youtube.com/watch?v=4_yxbh9Enoc
# RubyConf 2019 - Parallel Ruby: Managing the Memory Monster by Kevin Miller
#
#
# References:
# https://www.rubyguides.com/2015/07/ruby-threads/
# workers :: https://github.com/chadrem/workers
# celluloid :: https://github.com/celluloid/celluloid/wiki
# ruby-concurrency :: https://github.com/ruby-concurrency/concurrent-ruby
#

puts ->() {
       NUM_THREADS = 20

       def overly_simplified_example_function
         # start_memory_monitoring_thread

         threads = []
         NUM_THREADS.times do
           threads << Thread.new do
             loop { overly_simplified_thread_work }
           end
         end

         # threads.each(&:join) # if uncommented takes too long, ~almost infinite...
       end

       def overly_simplified_thread_work
         array = Array.new(4) { "a" * 4 }
         sleep(rand(0.01..0.1))
         p array
       end

       start = Process.clock_gettime(Process::CLOCK_MONOTONIC)
       overly_simplified_example_function
       finish = Process.clock_gettime(Process::CLOCK_MONOTONIC)
       puts "\nExec time: #{finish - start}\n"

       # https://www.rubyguides.com/2015/07/ruby-threads/
       t = Thread.new { puts "hello from thread" }
       t.join

       threads = []
       10.times {
         threads << Thread.new { puts 1 }
       }
       threads.each(&:join)
     }.()

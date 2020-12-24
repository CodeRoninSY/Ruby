#!/usr/bin/env ruby -w
# master_blocks.rb
# Dev: CodeRoninSY
# Date: <2020-12-07>
#

numbers = [1, 2, 3, 4, 5]

# 1
result = numbers.reduce { |sum, number| sum + number }
p result

# 2
result = numbers.reduce(:+)
p result



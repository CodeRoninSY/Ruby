#!/usr/bin/env ruby -w
#
# thinking_ML_ruby.rb
#
# Dev: CodeRoninSY
# Date: 2020-12-25
#
# RubyConf2013
# Brian Liles @bryanl
# Youtube: https://www.youtube.com/watch?v=cxqjgq4VhgY&list=PLE7tQUdRKcyYCsMvCcskeBe9DkSSt0oR2&index=13
#
#
# Intro to ML??
#
# * Regression
# * Linear regression
# Code from: https://gist.github.com/rweald/3517406
#
require 'csv'

# SimpleLinearRegression
class SimpleLinearRegression
  def initialize(xs, ys)
    @xs = xs
    @ys = ys
    if @xs.length != @ys.length
      raise 'Unbalanced data. xs need to be same length as ys'
    end
  end

  def y_intercept
    mean(@ys) - (slope * mean(@xs))
  end

  def slope
    x_mean = mean(@xs)
    y_mean = mean(@ys)

    numerator = (0...@xs.length).reduce(0) do |sum, i|
      sum + ((@xs[i] - x_mean) * (@ys[i] - y_mean))
    end

    denominator = @xs.reduce(0) do |sum, x|
      sum + ((x - x_mean)**2)
    end

    (numerator / denominator)
  end

  def mean(values)
    total = values.reduce(0) { |sum, x| x + sum }
    Float(total) / Float(values.length)
  end
end

# options for CSV reader
options = {
  col_sep: ',',
  skip_blanks: true,
  skip_lines: /^body/,
  headers: %w[body_wt brain_wt log_body log_brain]
}

# classical regression section
xs = []
ys = []
CSV.foreach('_brain_body_weight.csv', options) do |row|
  xs << row[0].to_f
  ys << row[1].to_f
end

slr = SimpleLinearRegression.new(xs, ys)

puts "slope: #{slr.slope}"
puts "y_intercept: #{slr.y_intercept}"

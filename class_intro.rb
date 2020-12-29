#!/usr/bin/env ruby -w
#
# class_intro.rb
#
# Dev: CodeRoninSY
# Date: 2020-12-21
#
# Advanced Class
# Ruby conference 2007 Advanced Ruby class design by Jim Weirich
# Youtube https://www.youtube.com/watch?v=vwBpTgdZBDk
#

require 'test/unit'

# FileList inherited from Array class
class FileList < Array

  # lazy loading
  def initialize(pattern=nil)
    super
    @items = []
    @pattern = pattern
    @resolved = false
  end

  def resolve
    self.clear
    Dir[@pattern].each do |arg|
      self << arg
    end
    @resolved = true
  end

  # auto resolve
  def [](index)
    resolve unless @resolved
    @items[index]
  end

  RESOLVING_METHODS = [:[], :size, :empty?, +:]

  RESOLVING_METHODS.each do |method|
    class_eval %{
      def #{method}(*args, &block)
        resolve unless @resolved
        @items.#{method}(*args, &block)
      end
    }
  end

end

# this will not work!
fl = FileList.new("*.rb")
# fl.resolve
# assert_equal 'begin_rescue.rb', fl[0]
p fl

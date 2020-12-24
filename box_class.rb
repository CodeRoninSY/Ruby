#!/usr/bin/ruby -w
# box_class.rb
#

# define class
class Box
  # initialize class variables
  @@count = 0
  # constructor method
  def initialize(w, h)
    @width, @height = w, h

    @@count += 1
  end

  # define to_s method
  def to_s
    "(w:#@width, h:#@height)"
  end

  def self.printCount()
    puts "Box count is: #@@count"
  end

  # accessor method
  def getWidth
    @width
  end

  def getHeight
    @height
  end

  # make private
  private :getWidth, :getHeight

  # setter methods
  def setWidth=(value)
    @width = value
  end

  def setHeight=(value)
    @height = value
  end

  # instance method
  def getArea
    @width * @height
  end

  # instance method to print area
  def printArea
    @area = getWidth() * getHeight
    puts "Box area is: #@area"
  end

  protected :printArea # protected can be called via .send

end

# create object
box = Box.new(10, 20)

# use setter methods
box.setWidth = 30
box.setHeight = 50

# use accessor methods
#x = box.getWidth()
#y = box.getHeight()

#puts "Width of the box is : #{x}"
#puts "Height of the box is : #{y}"

puts "String representation of box is: #{box}"

# call instance methods
a = box.getArea()
puts "Area of the box is : #{a}"

# try to call protected or methods
box.send(:printArea)

box1 = Box.new(30, 100)
b1 = box1.getArea()
puts "Area of box1: #{b1}"

Box.printCount()


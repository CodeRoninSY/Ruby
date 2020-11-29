#!/usr/bin/env ruby -w
# BEGIN - END
BEGIN { puts "Date and time: " + Time.now.to_s }

def bmi( weight, height )
  703.0 * ( weight.to_f/(height.to_f**2) )
end

my_bmi = bmi( 94, 180 )

puts " Your BMI is: " + x = sprintf( "%0.2f", my_bmi )

END { puts "You've got some work ahead of you." }


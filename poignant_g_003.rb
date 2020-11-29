#!/usr/bin/ruby -w
# poignant_g_003.rb
#
class LotteryTicket

  NUMERIC_RANGE = 1..25

  attr_reader :picks, :purchased

  # __init__ in python
  def initialize( *picks )
    if picks.length != 3
      raise ArgumentError, "three numbers must be picked"
    elsif picks.uniq.length != 3
      raise ArgumentError, "the three picks must be different numbers"
    elsif picks.detect { |p| not NUMERIC_RANGE === p }
      raise ArgumentError, "the three picks must be numbers between 1 and 25"
    end
    @picks = picks
    @purchased = Time.now
  end

  # __repr__ in python?
  def to_s( *text )
    if text.length == 0
      "No text given (picks:#@picks, purchased:#@purchased)"
    else
      p text
    end

  end

  def self.new_random
    new(rand(25)+1, rand(25)+1, rand(25)+1)
  rescue ArgumentError
    retry
  end

end


ticket = LotteryTicket.new( rand( 25 ) + 1,
            rand( 25 ) + 1, rand( 25 ) + 1 )



p  ticket.picks
p  ticket.purchased
p  "ticket: #{ticket}"
p  ticket
p  ticket.to_s("(picks:#{ticket.picks}, purchased:#{ticket.purchased})")
p  ticket.to_s



class Creature

  # 1. set up reader and writer methods
  attr_accessor :life, :strength, :charisma, :weapon

  # 2. add new class methods to use in creature
  def self.life( val )
    @traits ||= {}
    @traits['life'] = val
  end

  def self.strength( val )
    @traits ||= {}
    @traits['strength'] = val
  end

  def self.charisma( val )
    @traits ||= {}
    @traits['charisma'] = val
  end

  def self.weapon( val )
    @traits ||= {}
    @traits['weapon'] = val
  end

  # 3. initialize sets the default points for
  #    each trait
  def initialize
    self.class.traits.each do |k,v|
      instance_variable_set("@#{k}", v)
    end
  end

end


class Dragon < Creature
  life 1340     # tough scales
  strength 451  # bristling veins
  charisma 1020 # toothy smile
  weapon 939    # fire breath
end


drgn = Dragon.new

drgn.instance_eval do
  @name = "Tobias"
end


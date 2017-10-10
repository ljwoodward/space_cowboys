class Bounty
  attr_accessor :name, :species, :favourite_weapon, :collected_by

  def initialize(options)
    @name = options['name']
    @species = options['species']
    @favourite_weapon = options['favourite_weapon']
    @collected_by = options['collected_by']
  end

  
end

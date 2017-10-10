require('pry-byebug')
require_relative('models/bounty.rb')

bounty1 = Bounty.new(
  {'name' => 'The Vomitator',
  'species' => 'Slartymonster',
  'favourite_weapon' => 'Stomach Contents',
  'collected_by' => 'Duncan'}
)

bounty2 = Bounty.new(
  {'name' => 'Gwaaar',
  'species' => 'Toff',
  'favourite_weapon' => 'Rapier',
  'collected_by' => 'Rutger'}
)

binding.pry
nil

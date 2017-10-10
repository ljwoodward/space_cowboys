require("pg")

class Bounty
  attr_accessor :name, :species, :favourite_weapon, :collected_by

  def initialize(options)
    @name = options['name']
    @species = options['species']
    @favourite_weapon = options['favourite_weapon']
    @collected_by = options['collected_by']
  end

  def save()
    db = PG.connect( { dbname: 'space_cowboys', host: 'localhost' } )
    sql =
      "INSERT INTO bounties
      (
      	name,
      	species,
      	favourite_weapon,
      	collected_by
      )
      VALUES
      (
      	$1, $2, $3, $4
      )"
      values = [@name, @species, @favourite_weapon, @collected_by]
    db.prepare("save", sql)
    db.exec_prepared("save", values)
    db.close()
  end

  def self.all()
    db = PG.connect( { dbname: 'space_cowboys', host: 'localhost' } )
    sql = "SELECT * FROM bounties"
    values = []
    db.prepare("all", sql)
    bounty = db.exec_prepared("all", values)
    db.close()
    bounties = bounty.map {|bounties| Bounty.new(bounties)}
    return bounties

  end


end

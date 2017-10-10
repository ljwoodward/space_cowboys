require("pg")

class Bounty
  attr_accessor :name, :species, :favourite_weapon, :collected_by

  def initialize(options)
    @id = options['id'].to_i if options['id']
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
    @id =
    db.exec_prepared("save", values)[0]['id'].to_i()
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

  def self.delete_all()
    db = PG.connect( { dbname: 'space_cowboys', host: 'localhost' } )
    sql = "DELETE FROM bounties"
    values = []
    db.prepare("delete_all", sql)
    db.exec_prepared("delete_all", values)
    db.close()
  end

  def delete()
    db = PG.connect( { dbname: 'space_cowboys', host: 'localhost' } )
    sql = "DELETE FROM bounties WHERE id = $1"
    values = [@id]
    db.prepare("delete_one", sql)
    db.exec_prepared("delete_one", values)
    db.close()
  end

  def update()
    db = PG.connect( { dbname: 'space_cowboys', host: 'localhost' } )
    sql = "
    UPDATE bounties
    SET (
      name,
      species,
      favourite_weapon,
      collected_by
    ) =
    (
      $1, $2, $3, $4
    ) WHERE id = $5
    "
    values = [@name, @species, @favourite_weapon, @collected_by, @id]
    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close()
  end


end

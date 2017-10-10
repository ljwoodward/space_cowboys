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
      "INSERT INTO bounty
      (
      	name,
      	species,
      	favourite_weapon,
      	collected_by
      )
      VALUES
      (
      	$1, $2, $3, $4
      );"
      values = [@name, @species, @favourite_weapon, @collected_by]
    db.prepare("save", sql)
    db.exec_prepared("save", values)
    db.close()
  end


end

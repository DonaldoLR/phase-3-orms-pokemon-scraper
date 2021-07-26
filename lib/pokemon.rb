class Pokemon

  attr_accessor :name, :type, :db
  attr_reader :id

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(pokemon, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL
    db.execute(sql, pokemon, type)
  end

  def self.find(index, db)
    sql = <<-SQL
      SELECT * FROM pokemon
      WHERE id = ?
    SQL

    row = db.execute(sql, index)[0]
    Pokemon.new(id: row[0], name: row[1], type: row[2], db: db)
  end
end

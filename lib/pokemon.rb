class Pokemon
    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id, db)
        pokemon_details = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
        Pokemon.new(id: pokemon_details[0], name: pokemon_details[1], type: pokemon_details[2], db: db)
    end

end

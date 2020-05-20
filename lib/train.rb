require('pry')

class Train
  attr_accessor :id, :name, :city_id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def self.all
    returned_trains = DB.exec("SELECT * FROM trains;")
    trains = []
    returned_trains.each() do |train|
      name = train.fetch("name")
      id = train.fetch("id").to_i
      trains.push(Train.new({:name => name, :id => id}))
    end
    trains
  end

  def self.get_trains(db_query)
    returned_trains = DB.exec(db_query)
    trains = []
    returned_trains.each() do |train|
      name = train.fetch('name')
      id = train.fetch('id').to_i
      trains.push(Train.new({:name => name, :id => id}))
    end
    trains
  end

  def save 
      result = DB.exec("INSERT INTO trains (name) VALUES ('#{@name}') RETURNING id;")
      @id = result.first().fetch("id").to_i
  end

  def self.clear
    DB.exec("DELETE FROM trains *;")
  end

   def ==(trains_to_compare)
    self.name() == trains_to_compare.name()
   end

  def self.find(id)
    train = DB.exec("SELECT * FROM trains WHERE id = #{id};").first
    name = train.fetch("name")
    id = train.fetch("id")
    Train.new({:name => name, :id => id})
  end

  def update(name)
    @name = name
    DB.exec("UPDATE trains SET name = '@{name}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM trains WHERE id = #{@id};")
    # DB.exec("DELETE FROM cities WHERE train_id = #{@id};") # Will have to be city_id when added. And cities=stop
  end

  def self.search(search)
    self.get_trains("SELECT * FROM trains WHERE lower(name) LIKE '%#{search}%';")
  end

  def train 
    Train.find(@train_id)
  end
end


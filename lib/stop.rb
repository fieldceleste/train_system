require 'pry'
require 'spec_helper'

class Stop
  attr_reader :id
  attr_accessor :city_id, :train_id

  def initialize(attributes)
    @id = attributes.fetch(:id)
    @city_id = attributes.fetch(:city_id)
    @train_id = attributes.fetch(:train_id)
    # @name = attributes.fetch(:name)
  end

  def ==(stop_to_compare)
    if stop_to_compare != nil
      (self.city_id() == stop_to_compare.city_id()) && (self.train_id() == stop_to_compare.train_id())
    else
      false
    end
  end
    
  def self.all
    returned_stops = DB.exec("SELECT * FROM trains_cities;")
    stops = []
    returned_stops.each() do |stop|
      # name = stop.fetch("name")
      city_id = stop.fetch("city_id").to_i
      train_id = stop.fetch("train_id").to_i
      id = stop.fetch("id").to_i
      stops.push(Stop.new({:name => name, :id => id, :city_id => city_id, :train_id => train_id}))
    end
    stops
  end

  def save()
    result = DB.exec("INSERT INTO trains_cities (city_id, train_id) VALUES ('#{@city_id}', '#{@train_id}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def update(params)
    @train_id = params[:train_id].to_i
    @city_id = params[:city_id].to_i
    DB.exec("UPDATE trains_cities SET train_id = '#{@train_id}', city_id = #{@city_id} WHERE id = #{@id};")
  end

  def self.clear
    DB.exec("DELETE FROM trains_cities")
  end

  # def delete
  #   DB.exec("DELETE FROM trains_cities WHERE train_id = #{@id};") 
  # end
  def self.find_by_train(tr_id)
    cities = []
    returned_cities = DB.exec("SELECT * FROM cities WHERE train_id = #{tr_id};")
    returned_cities.each() do |city|
      name = city.fecth("name")
      id = city.fetch("id").to_i
      cities.push(Stop.new({:name => name, :train_id => tr_id, :id => id}))
    end
    cities
  end
end 


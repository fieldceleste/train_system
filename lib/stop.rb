require 'pry'
require 'spec_helper'

class Stop
  attr_reader :id
  attr_accessor :city_id, :train_id

  def initialize(attributes)
    @id = attributes.fetch(:id)
    @city_id = attributes.fetch(:city_id)
    @train_id = attributes.fetch(:train_id)
  end

  def ==(stop_to_compare)
    if stop_to_compare != nil
      (self.train_id() == stop_to_compare.train_id()) && (self.city_id() == stop_to_compare.city_id())
    else
      false
    end
  end
    
  def self.get_stops(stops)
    stops_output = []
    stops.each() do |stop|
      city_id = stop.fetch("city_id").to_i
      train_id = stop.fetch("train_id").to_i
      id = stop.fetch("id").to_i
      stops_output.push(Stop.new({:id => id, :city_id => city_id, :train_id => train_id}))
    end
    stops_output
  end

  def self.all
    returned_stops = DB.exec("SELECT * FROM trains_cities;")
    Stop.get_stops(returned_stops)
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

  def delete
    DB.exec("DELETE FROM trains_cities WHERE id = #{@id};") 
  end

  def self.clear
    DB.exec("DELETE FROM trains_cities")
  end

  def self.find(id)
    returned_stops = DB.exec("SELECT * FROM trains_cities WHERE id = #{id};")
    Stop.get_stops(returned_stops)
  end

  def self.find_by_city_id(city_id)
    returned_stops = DB.exec("SELECT * FROM trains_cities WHERE city_id = #{city_id}")
    Stop.get_stops(returned_stops)
  end

  def self.find_by_train_id(train_id)
    returned_stops = DB.exec("SELECT * FROM trains_cities WHERE train_id = #{train_id}")
    Stop.get_stops(returned_stops)
  end
end 


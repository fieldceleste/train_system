require 'spec_helper'

describe('#Stop') do

  describe(".all") do
    it("starts off with no stops") do
      expect(Stop.all()).to(eq([]))
    end
  end

  describe("#id") do 
   it("returns a train stop by id") do 
   stop = Stop.new({:train_id => 1, :city_id => 1, :id => nil})
     expect(stop.train_id()).to(eq(1))
     expect(stop.city_id()).to(eq(1))
    end
  end


  # describe("#id") do
  #   it("returns a stop by id") do 
  #     stop = Stop.new({:name => "Red Line", :train_id => 1, :city_id => 1, :id => nil})
  #     stop.save()
  #     expect(stop.id()).to(eq([]))
  #   end 
  # end

  describe("#save") do
    it("saves a stop") do
      stop = Stop.new({:train_id => 1, :city_id => 1, :id => nil})
      stop.save()
      stop2 = Stop.new({:train_id => 1, :city_id => 2, :id => nil})
      stop2.save()
      expect(Stop.all).to(eq([stop, stop2]))
    end
  end

  describe('#==') do
    it('is the same stop if it has the same attributes as another stop') do
      stop = Stop.new({:train_id => 1, :city_id => 1, :id => nil})
      stop2 = Stop.new({:train_id => 1, :city_id => 1, :id => nil})
      expect(stop).to(eq(stop2))
    end
  end

  describe('#update') do
    it('updates a stop by id') do
      stop = Stop.new({:train_id => 1, :city_id => 1, :id => nil})
      stop.save()
      stop.update({:train_id => 2, :city_id => 2, :id => nil})
      expect(stop.train_id()).to(eq(2))
      expect(stop.city_id()).to(eq(2))
    end
  end

  describe('.clear') do
    it('clears all stops') do
      stop = Stop.new({:train_id => 1, :city_id => 1, :id => nil})
      stop.save()
      stop2 = Stop.new({:train_id => 1, :city_id => 2, :id => nil})
      stop2.save()
      Stop.clear()
      expect(Stop.all).to(eq([]))
    end
  end
  describe('.find_by_train') do
    it("finds trains for city ") do
      train = Train.new({:name => "Red Line", :train_id => 2, :id => nil})
      train.save()
      city = City.new({:name => "Beaverton", :city_id => 1, :id => nil})
      city.save()
      city2 = City.new({:name => "Clackamas", :city_id => 4, :id => nil})
      city2.save()
      expect(City.find_by_train(train.id)).to(eq([city2]))
    end
   end
 end


  # describe('#delete') do 
  #   it("deletes a stop by id") do 
  #     stop = Stop.new({:train_id => 1, :city_id => 1, :id => nil})
  #     stop.save()
  #     stop2 = Stop.new({:train_id => 1, :city_id => 2, :id => nil})
  #     stop2.save()
  #     stop.delete()
  #     expect(Stop.all).to(eq([stop2]))
  #   end
  # end
  

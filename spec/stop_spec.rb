require 'spec_helper'

describe('#Stop') do

before(:each) do
  @train = Train.new({:name => "Milwaukie", :id => nil})
  @train.save
end

  describe(".all") do
    it("starts off with no stops") do
      expect(Stop.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves a stop") do
      stop1 = Stop.new({:train_id => 1, :city_id => 1, :id => nil})
      stop1.save()
      stop2 = Stop.new({:train_id => 1, :city_id => 2, :id => nil})
      stop2.save()
      expect(Stop.all()).to(eq([stop1, stop2]))
    end
  end

  describe('#==') do
    it('is the same stop if it has the same attributes as another stop') do
      stop1 = Stop.new({:train_id => 1, :city_id => 1, :id => nil})
      stop2 = Stop.new({:train_id => 1, :city_id => 1, :id => nil})
      expect(stop1).to(eq(stop2))
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

  describe('#delete') do 
    it("deletes a stop by id") do 
      stop = Stop.new({:train_id => 1, :city_id => 1, :id => nil})
      stop.save()
      stop2 = Stop.new({:train_id => 1, :city_id => 2, :id => nil})
      stop2.save()
      stop.delete()
      expect(Stop.all).to(eq([stop2]))
    end
  end

  describe('.find') do 
    it("will find a stop by id") do
    stop1 = Stop.new({:train_id => 1 , :city_id => 2, :id => nil})
    stop1.save()
    stop2 = Stop.new({:train_id => 1 , :city_id => 1, :id => nil})
    stop2.save()
    expect(Stop.find(stop1.id)).to(eq([stop1]))
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

  describe('find_by_city_id') do
    it('finds stops by city_id') do
      stop1 = Stop.new({:train_id => 1 , :city_id => 2, :id => nil})
      stop1.save()
      stop2 = Stop.new({:train_id => 1 , :city_id => 1, :id => nil})
      stop2.save()
      expect(Stop.find_by_city_id(2)).to(eq([stop1]))
    end
  end
  describe('find_by_train_id') do 
    it('finds stops by train_id') do
      stop1 = Stop.new({:train_id => 1 , :city_id => 2, :id => nil})
      stop1.save()
      stop2 = Stop.new({:train_id => 1 , :city_id => 1, :id => nil})
      stop2.save()
      expect(Stop.find_by_train_id(1)).to(eq([stop1, stop2]))
    end
  end
  

end
require 'docking_station2'

describe DockingStation do
  docking_station = DockingStation.new

  describe '#release_bike' do
    let(:bike_double) {double("Bike", :working? => true)}
    it 'releases a bike' do
      allow(docking_station).to receive(:puts).and_return(nil)
      allow(docking_station).to receive(:gets).and_return("N")
      docking_station.return_bike(bike_double)
      expect(docking_station.release_bike).to eq bike_double
    end

    it 'raises an error if there are no bikes' do
      expect{docking_station.release_bike}.to raise_error("There are no bikes to take")
    end

    it 'Only releases working bikes' do
      allow(subject).to receive(:puts).and_return(nil)
      allow(subject).to receive(:gets).and_return("N")
      subject.return_bike(Bike.new)
      allow(subject).to receive(:gets).and_return("Y")
      subject.return_bike(Bike.new)
      expect(subject.release_bike.working?).to eq true
    end
  end

  describe '#return_bike' do
    let(:bike_double) {double("Bike", :working? => true)}
    it 'adds a bike to the dock' do
      allow(docking_station).to receive(:puts).and_return(nil)
      allow(docking_station).to receive(:gets).and_return("N")
      docking_station.return_bike(bike_double)
      expect(docking_station.collection.empty?).to eq false
    end

    it 'raises an error if dock is full' do
      allow(subject).to receive(:puts).and_return(nil)
      allow(subject).to receive(:gets).and_return("N")
      20.times {subject.return_bike(bike_double)}
      expect{subject.return_bike(bike_double)}.to raise_error("Dock is full!")
    end

  end

  describe 'report' do
    it 'reports a bike as broken if user answers Y' do
      allow(subject).to receive(:puts).and_return(nil)
      allow(subject).to receive(:gets).and_return("Y")
      bike = Bike.new
      subject.return_bike(bike)
      expect(bike.working?).to eq false
    end

    it 'Does not report bike as broken if user answers N' do
      allow(subject).to receive(:puts).and_return(nil)
      allow(subject).to receive(:gets).and_return("N")
      bike = Bike.new
      subject.return_bike(bike)
      expect(bike.working?).to eq true
    end
  end

  describe '#initialize' do
    it 'it creates a docking station of a capacity = 20' do
      expect(subject.collection.capacity).to eql 20 
    end

    it 'creates a docking station argument dependent' do
      ds = DockingStation.new(12)
      expect(ds.collection.capacity).to eql 12
    end
  end

end

describe Van do

  garage = Garage.new
  dock = DockingStation.new
  van = Van.new(garage)
  bike = Bike.new
  bikes = Collection.new(30).bikes << bike

  describe "#load" do
    it "loads broken bikes onto the van" do
      van.load(dock, bikes)
      expect(dock.collection.bikes).not_to include bikes
    end
  end

  describe "#unload" do
    it "unloads fixed bikes onto the docking station" do
      van.unload(dock)
      expect(dock.collection.bikes).to eq bikes
    end
  end
end

describe Garage do
  garage = Garage.new
  bike = Bike.new
  bikes = Collection.new(50).bikes << bike


  describe "#fix_bikes" do
    it "garage fixes the bikes" do
      garage.fix_bikes
      expect(bike.fixed). to eq true
    end
  end
end

describe Bike do
  bike = Bike.new

  describe "#new" do
    it "check whether the bike works" do
      expect(subject.working?).to eq true
    end
  end

end

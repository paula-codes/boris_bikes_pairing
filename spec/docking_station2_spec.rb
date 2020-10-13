require 'docking_station2'

describe DockingStation do
  docking_station = DockingStation.new
  bike = docking_station.release_bike

  describe '#release_bike' do
    it 'releases a bike' do
      expect(subject.release_bike).to eq "I have released a bike"
    end
  end

  describe '#return_bike' do
    it 'adds a bike to the dock' do
      actual = subject.return_bike
      #this line is failing, we need to check
      #whether the array has been editied
      expected = docking_station.length
      expect(actual).to eq expected
    end
  end

  describe '#see_bike' do
    it 'checks to see if there is a bike in the dock to release' do
      actual = subject.see_bike
      expected = "There is a bike"s
      expect(actual).to eq expected
    end
  end

end

describe Bike do
  bike = Bike.new

  describe "#working?" do
    it "check whether the bike works" do
      expect(subject.working?).to eq "This bike is working"
    end
  end

  describe "#new" do
    it "check whether the bike works" do
      expect(subject.working?).to eq "This bike is working"
    end
  end

  bike.working?
end

# 1. change code to work with an attirbute reader
# 2. edit expected values to work from array not text
#

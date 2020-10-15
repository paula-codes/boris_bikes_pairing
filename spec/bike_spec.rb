require 'docking_station2'

describe Bike do
  bike = Bike.new

  describe "#working?" do
    it "check whether the bike works" do
      expect(subject.working?).to eq true
    end
  end
end

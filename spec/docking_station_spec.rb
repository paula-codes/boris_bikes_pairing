require "docking_station"

  describe DockingStation do

    describe "#release_bike" do
      it "return true to release the bike" do
      
        actual_value = subject.release_bike
        expected_value = true
        expect(actual_value).to eq expected_value
      end

    end
  end

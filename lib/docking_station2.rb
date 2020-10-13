class DockingStation

  def initialize
    @dock_array = ["bike"]
  end

  def release_bike
    if @dock_array.length == 0
      return "There are no bikes to take"
    else
      @dock_array.pop
      bike = Bike.new
      return "I have released a bike"
    end
  end

  def return_bike
    @dock_array << "Bike"
    #return "I have returned a bike"
  end

  def see_bike
    if @dock_array.length != 0
      return "There is a bike"
    else
      return "There are no bikes to see"
    end
  end

end

class Bike

  def working?
    return "This bike is working"
  end

end

#docking_station = DockingStation.new
#docking_station.return_bike

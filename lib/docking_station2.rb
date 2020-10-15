class DockingStation
  attr_reader :collection

  def initialize(capacity = 20)
    @collection = Collection.new(capacity)
    @broken_bikes = Collection.new(capacity).bikes
  end

  def release_bike
    if @collection.empty?
      raise "There are no bikes to take"
    else
      if @collection.bikes.last.working?
        return @collection.bikes.pop
      else
        @collection.bikes.each {|bike| return bike unless !bike.working?}
      end
    end
  end

  def return_bike(bike)
    report(bike)

    if @collection.full?
      raise "Dock is full!"
    elsif bike.working?
      @collection.bikes << bike
    end
  end

  def report(bike)
    puts "Is this bike broken?"
    user_input = gets.chomp
    case user_input.upcase
    when "Y"
      bike.broken
      @broken_bikes << bike
    end
  end

end

class Bike

  def initialize
    @working = true
  end

  def working?
    return @working
  end

  def broken
    @working = false
  end

  def fixed
    @working = true
  end

end

class Collection
  attr_accessor :bikes
  attr_reader :capacity

  def initialize(capacity)
    @bikes = []
    @capacity = capacity
  end

  def full?
    if @bikes.length == @capacity
      return true
    else
      return false
    end
  end

  def empty?
    if @bikes.empty?
      return true
    else
      return false
    end
  end

end

class Van
  attr_accessor :collection
  def initialize(garage)
    @collection = Collection.new(10)
    @docking_stations = []
    @garage = garage
  end

  def load(dock, bikes)
    bikes.each do |bike| 
      dock.collection.bikes.delete(bike)
      @collection.bikes << bike
    end
  end

  def unload(dock)
    @collection.bikes.each do |bike|
      @collection.bikes.delete(bike)
      dock.collection.bikes << bike
    end
  end

end

class Garage
  attr_accessor :collection

  def initialize
    @collection = Collection.new(50)
  end

  def fix_bikes
    @collection.bikes.each do |bike|
      bike.fixed
    end
  end
    
end

#docking_station = DockingStation.new
#docking_station.return_bike

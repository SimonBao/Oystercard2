class Journey
  attr_reader :temp_trip

  def initialize
    @temp_trip = {entry_station: nil , exit_station: nil}
  end


  def start_journey(station)
    @temp_trip[:entry_station] = station
  end

end

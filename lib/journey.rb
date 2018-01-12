class Journey
  attr_reader :trip

  PENALTY_CHARGE = 6

  def initialize
    @trip = {entry_station: nil , exit_station: nil}
  end

  def start_journey(station)
    @trip[:entry_station] = station
  end

  def end_journey(station)
    @trip[:exit_station] = station
  end

  def complete_journey?
    @trip[:entry_station] != nil && @trip[:exit_station] != nil
  end

  def fare_calculated
    self.complete_journey? ? Oystercard::MINIMUM_CHARGE : PENALTY_CHARGE
  end

end

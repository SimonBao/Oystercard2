require_relative 'journey'

class JourneyLog

  attr_reader

  def initialize(journey_class = Journey)
    @journey_class = journey_class
  end

  def start(entry_station)
    @current_journey = @journey_class.new
    @current_journey.start_journey(entry_station)
  end

  def finish(exit_station)
    @current_journey.end_journey(exit_station)
  end

  private

  def journeys

  end
  
  def current_journey

  end

end

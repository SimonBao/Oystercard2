require_relative "journey"

class Oystercard
attr_reader :balance
attr_reader :entry_station
attr_reader :history
attr_reader :current_journey

BALANCE_LIMIT = 90
MINIMUM_BALANCE = 1
MINIMUM_CHARGE = 1

  def initialize(journey_class = Journey)
   @balance = 0
   @entry_station = nil
   @history = []
   #@temp_journey = {}
   @journey_class = journey_class
  end

  def top_up(amount)
    raise "Balance limit of #{BALANCE_LIMIT} reached" if amount +balance > BALANCE_LIMIT
    @balance += amount
  end

  def touch_in(station)
    fail "Insufficient balance" if @balance < MINIMUM_BALANCE
    if current_journey then complete_journey end
    @current_journey = @journey_class.new
    @current_journey.start_journey(station)
  end


  def touch_out(station)
    @current_journey.end_journey(station)
    complete_journey


    # @entry_station = nil
    # @temp_journey[:exit_station] = station
    # store_full_journey(temp_journey)
    # deduct(MINIMUM_CHARGE)
  end

  def store_full_journey(current_journey)
    @history << current_journey
  end

  def deduct(amount)
    @balance -= amount
  end

  private



  def complete_journey
    deduct(@current_journey.fare_calculated)
    store_full_journey(current_journey)
    @current_journey = nil
  end

end

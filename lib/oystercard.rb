require_relative "journey"

class Oystercard
attr_reader :balance
attr_reader :entry_station
attr_reader :history
attr_reader :temp_journey

BALANCE_LIMIT = 90
MINIMUM_BALANCE = 1
MINIMUM_CHARGE = 1

  def initialize
   @balance = 0
   @entry_station = nil
   @history = []
   @temp_journey = {}
  end

  def top_up(amount)
    raise "Balance limit of #{BALANCE_LIMIT} reached" if amount +balance > BALANCE_LIMIT
    @balance += amount
  end

  def touch_in(station)
    fail "Insufficient balance" if @balance < MINIMUM_BALANCE
    Journey.complete_journey? ? Journey.start_journey(station) : deduct(Journey.fare_calculated)
    # @entry_station = station
    # @temp_journey[:entry_station] = station
  end


  def touch_out(station)
    @entry_station = nil
    @temp_journey[:exit_station] = station
    store_full_journey(temp_journey)
    deduct(MINIMUM_CHARGE)
  end

  def store_full_journey(temp_journey)
    @history << temp_journey
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end

class Oystercard
attr_reader :balance
attr_reader :entry_station
attr_reader :journeys
attr_reader :temp_journey

BALANCE_LIMIT = 90
MINIMUM_BALANCE = 1
MINIMUM_CHARGE = 1

  def initialize
   @balance = 0
   @entry_station = nil
   @journeys = []
   @temp_journey = {}
  end

  def top_up(amount)
    raise "Balance limit of #{BALANCE_LIMIT} reached" if amount +balance > BALANCE_LIMIT
    @balance += amount
  end



  def touch_in(station)
    @entry_station = station
    @temp_journey[:entry_station] = station
    fail "Insufficient balance" if @balance < MINIMUM_BALANCE
  end

  def touch_out(station)
    @entry_station = nil
    @temp_journey[:exit_station] = station
    store_full_journey(temp_journey)
    deduct(MINIMUM_CHARGE)
  end

  def store_full_journey(temp_journey)
    @journeys << temp_journey
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end

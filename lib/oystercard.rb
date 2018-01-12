require_relative "journey"

class Oystercard
attr_reader :balance
attr_reader :history
attr_reader :current_journey

BALANCE_LIMIT = 90
MINIMUM_BALANCE = 1
MINIMUM_CHARGE = 1

  def initialize(journey_class = Journey)
   @balance = 0
   @history = []
   @journey_class = journey_class
  end

  def top_up(amount)
    raise "Balance limit of #{BALANCE_LIMIT} reached" if limit_exceeded?(amount)
    @balance += amount
  end

  def touch_in(station)
    fail "Insufficient balance" if !enough_money?
    if current_journey then complete_journey end
    @current_journey = @journey_class.new #refactor
    @current_journey.start_journey(station)
  end

  def touch_out(station)
    @current_journey = @journey_class.new if @current_journey == nil #refactor
    @current_journey.end_journey(station)
    complete_journey
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

  def store_full_journey(current_journey)
    @history << current_journey
  end

  def enough_money?
    balance > MINIMUM_BALANCE
  end

  def limit_exceeded?(amount = 0)
    amount + balance > BALANCE_LIMIT
  end

end

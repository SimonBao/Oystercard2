require "oystercard"

describe Oystercard do

let(:station) {double :station}
let(:entry_station) {double :entry_station}
let(:exit_station) {double :exit_station}

  it 'sets zero balance on new oystercard' do
    expect(subject.balance).to eq 0
  end

  describe '#top_up' do

    it 'can top up the balance' do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end

    it 'raises error when balance excedes balance limit' do
      balance_limit = Oystercard::BALANCE_LIMIT
      subject.top_up(balance_limit)
      error = "Balance limit of #{balance_limit} reached"
      expect{subject.top_up(1)}.to raise_error error
    end
  end

  describe '#in_journey?' do
    let(:station) {double :station}
    before do
      subject.top_up(Oystercard::BALANCE_LIMIT)
    end
end

  describe '#touch_out'do

    it 'stores nil when touched out'do
      subject.top_up(5)
      subject.touch_out(station)
      expect(subject.entry_station).to eq nil
    end
  end

  describe '#touch_in' do
    it 'raises error when touched in card has insufficient balance'do
      expect{subject.touch_in(station)}.to raise_error 'Insufficient balance'
    end

    it 'stores the entry station'do
      subject.top_up(10)
      expect{subject.touch_in(station)}.to change{subject.entry_station}.to station
    end
  end

  describe '#store_full_journey' do
    let(:journey) { {entry_station: entry_station, exit_station: exit_station} }
    before do
      subject.top_up(Oystercard::BALANCE_LIMIT)
    end

    it "stores journey" do
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.journeys).to include journey
    end
  end

end

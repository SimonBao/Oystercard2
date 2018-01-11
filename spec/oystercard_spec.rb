require "oystercard"

describe Oystercard do
subject(:oystercard) {described_class.new}
let(:journey) {double :journey}
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

    let(:journey_class) {double :journey_class , new: journey}
    let(:journey) {double :journey}

  it "Stores the exit station" do
    allow(journey).to receive(:fare_calculated).and_return(6)
    oystercard = Oystercard.new(journey_class)
    expect(journey).to receive(:end_journey)
    oystercard.top_up(10)
    oystercard.touch_out(station)

  end

    # it 'stores nil when touched out'do
    #   skip
    #   subject.top_up(5)
    #   subject.touch_out(station)
    #   expect(subject.entry_station).to eq nil
    # end
  end

  describe '#touch_in' do
    it 'raises error when touched in card has insufficient balance'do
      expect{subject.touch_in(station)}.to raise_error 'Insufficient balance'
    end

    let(:journey_class) {double :journey_class , new: journey}
    let(:journey) {double :journey}
    it 'stores the entry station'do

      oystercard = Oystercard.new(journey_class)
      oystercard.top_up(10)

      expect(journey).to receive(:start_journey)#.with('Barking')
      oystercard.touch_in(station) #or ("Barking")

    end
  end

  describe '#store_full_journey' do
    let(:journey) { {entry_station: entry_station, exit_station: exit_station} }
    before do
      subject.top_up(Oystercard::BALANCE_LIMIT)
    end

    # it "stores journey" do
    #   subject.touch_in(entry_station)
    #   subject.touch_out(exit_station)
    #   expect(subject.history).to include journey
    # end
  end

end

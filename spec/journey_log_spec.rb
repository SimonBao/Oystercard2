require "journey_log"

describe JourneyLog do

  subject(:journey_log) {described_class.new(journey_class)}
  let(:journey_class) {double :journey_class, new: journey}
  let(:journey) {double :journey}

  describe "#start" do

    it "starts journey with a entry station" do
      allow(journey).to receive(:start_journey).and_return("Barking")
      expect(journey_log.start("Barking")).to eq "Barking"
    end
  end

  describe "#finish" do

    it "ends journey with a exit station" do
      allow(journey).to receive(:end_journey).and_return("Brixton")
      expect(journey_log.finish("Brixton")).to eq "Brixton"
    end
  end

end

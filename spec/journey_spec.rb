require 'journey'

describe Journey do

  context "Journey Class" do
    it "should create a journey object" do
      expect(subject).to be_a Journey
    end

    it "Should create a trip variable" do
      expect(subject.trip).to eql({:entry_station => nil, :exit_station => nil})
    end
  end

  context "#start_journey" do
    it "Should store entry station in trip" do
      subject.start_journey("Bank")
      expect(subject.trip).to eql({:entry_station => "Bank", :exit_station => nil})
    end
  end

  context "#end_journey" do
    it "Should store exit station in trip" do
      subject.start_journey("Bank")
      subject.end_journey("Brixton")
      expect(subject.trip).to eql({:entry_station => "Bank", :exit_station => "Brixton"})
    end
  end

  context "#complete_journey?" do
    it "Should return false for incomplete journey" do
      subject.start_journey("Bank")
      expect(subject.complete_journey?).to eq false
    end
  end

  context "#fare" do
    it "Should return minimum charge" do
      subject.start_journey("Bank")
      subject.end_journey("Brixton")
      expect(subject.fare_calculated).to eq 1
    end

    it "Should return penalty charge" do
      subject.start_journey("Bank")
      expect(subject.fare_calculated).to eq 6
    end
  end

end

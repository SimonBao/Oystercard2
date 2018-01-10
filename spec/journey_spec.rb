require 'journey'

describe Journey do

  context "Journey Class" do
    it "should create a journey object" do
      expect(subject).to be_a Journey
    end

    it "Should create a temp_trip variable" do
      expect(subject.temp_trip).to eql({:entry_station => nil, :exit_station => nil})
    end
  end

  context "#start_journey" do
    it "Should store entry station in temp_trip" do
      subject.start_journey("Bank")
      expect(subject.temp_trip).to eql({:entry_station => "Bank", :exit_station => nil})
    end
  end

  context "#end_journey" do
    it "Should store exit station in temp_trip" do
      subject.start_journey("Bank")
      subject.end_journey("Brixton")
      expect(subject.temp_trip).to eql({:entry_station => "Bank", :exit_station => "Brixton"})
    end
  end

  context "#complete_journey?" do
    it "Should return false for incomplete journey" do
      subject.start_journey("Bank")
      expect(subject.complete_journey?).to eq false
    end
  end

end

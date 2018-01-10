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

end

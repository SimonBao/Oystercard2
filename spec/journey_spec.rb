require 'journey'

describe Journey do

  context "Should create a new journey class" do
    it "should create a journey object" do
      expect(subject).to be_a Journey
    end

    it "should create an entry station variable" do
      expect(subject.entry_station).to eq nil
    end

    it "should create an exit station variable" do
      expect(subject.exit_station).to eq nil
    end
  end

  # describe "" do
  #
  # end

end

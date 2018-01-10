require 'station'

describe Station do
  context "Should create a station class" do
    subject(:station){described_class.new("Kings Cross", 2)}

    it "should expose zone variable" do
      expect(station.zone).to eq 2
    end

    it "should expose name variable" do
      expect(station.name).to eq "Kings Cross"
    end


  end


end

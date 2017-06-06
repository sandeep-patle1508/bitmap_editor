require 'spec_helper'

describe BitmapEditor::Bitmap do

  #### INSTANCE METHODS
  subject { BitmapEditor::Bitmap.new }

  describe "#Initialize" do
    it { is_expected.to respond_to :width }
    it { is_expected.to respond_to :width= }

    it { is_expected.to respond_to :height }
    it { is_expected.to respond_to :height= }

    it { is_expected.to respond_to :pixels }
    it { is_expected.to respond_to :pixels= }  

    it "should form empty bitmap object" do
      expect( subject.width  ).to eq 0
      expect( subject.height ).to eq 0
      expect( subject.pixels ).to be_a Array
    end
  end

  describe "#dimension" do
    before do
      subject.width  = 3
      subject.height = 4
    end

    it "should calculate bitmap's dimension" do
      expect( subject.dimension ).to eq 12
    end
  end

  describe "#generate_pixels" do
    before do
      subject.width  = 3
      subject.height = 4
    end

    it "should generate the bitmap's pixels" do
      expect{ subject.generate_pixels }.to change { subject.pixels }.to( [["O", "O", "O"],["O", "O", "O"],["O", "O", "O"],["O", "O", "O"]] )
    end
  end
  
end
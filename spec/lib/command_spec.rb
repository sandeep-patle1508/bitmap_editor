require 'spec_helper'

describe BitmapEditor::Command do

  let(:bitmap) { BitmapEditor::Bitmap.new }

  #### Instance Methods
  describe "#Initialize" do
    subject { BitmapEditor::Command.new(bitmap, ['I', 3, 4]) }

    it { is_expected.to be_instance_of BitmapEditor::Command }

    it "should assigns class variables" do
      expect( subject.key ).to eq 'I'
      expect( subject.params ).to be_a Array
      expect( subject.params ).to match [3, 4]
    end
  end

end
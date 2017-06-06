require 'spec_helper'

describe BitmapEditor::App do

  let(:input_file) { File.expand_path('../support/show.txt', File.dirname(__FILE__)) }
  subject { BitmapEditor::App.new.run(input_file) }

  #### Instance Methods
  describe "Initialize" do

    subject { BitmapEditor::App.new }
    it { is_expected.to be_instance_of(BitmapEditor::App) }

    it "should assign particular variables" do
      expect( subject.bitmap ).to be_a BitmapEditor::Bitmap
    end

  end

  describe "Run" do

    context 'when File does not exists' do
      subject { BitmapEditor::App.new }
      let(:input_file) { nil }

      it 'should return gracefully with a valid message' do
        expect { subject.run(input_file) }.to output("please provide correct file").to_stdout
      end
    end

  end

end 
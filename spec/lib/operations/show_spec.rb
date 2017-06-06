require 'spec_helper'

describe BitmapEditor::Operations::Show do

  let(:params) { [] }
  let(:bitmap) { BitmapEditor::Bitmap.new(3, 3) }
  before { bitmap.generate_pixels }

  #### INSTANCE METHODS
  describe 'Initialize' do
    subject { BitmapEditor::Operations::Show.new(bitmap, params) }

    it { is_expected.to be_instance_of BitmapEditor::Operations::Show }

    describe '#Validate' do
      context 'validates too many params' do
        let(:params) { [1] }

        it 'should return raise error when too many parameters' do
          expect{ subject.validate(params) }.to raise_error BitmapEditor::ParamsValidationError
        end
      end

      context 'passing validation' do
        it 'should not raise any errors when validation satisfied' do
          expect( subject.validate(params) ).to be_nil
        end
      end
    end
  end

  describe 'Perform' do
    subject { BitmapEditor::Operations::Show.new(bitmap,params).perform }

    it 'should return array as result' do
      expect( subject ).to eq "OOO\nOOO\nOOO\n"
    end
  end

end
require 'spec_helper'

describe BitmapEditor::Operations::FillRegion do

  let(:params) { [3, 3, 'C'] }
  let(:bitmap) { BitmapEditor::Bitmap.new(3, 3) }

  before do
    bitmap.pixels = [['F', 'O', 'O'], ['F', 'F', 'F'], ['F', 'O', 'O']]
  end

  context 'Instance method' do
    subject { BitmapEditor::Operations::FillRegion.new(bitmap, params) }
    
    it { is_expected.to be_instance_of BitmapEditor::Operations::FillRegion }

    describe '#Validate' do

      context 'validates too many params' do
        let(:params) { [2, 2, 'C', 3] }

        it 'should return raise error when too many parameters' do
          expect{ subject.validate(params) }.to raise_error BitmapEditor::ParamsValidationError
        end
      end

      context 'validates too few params' do
        let(:params) { [1, 2] }
        
        it 'should return raise error when not enough parameters' do
          expect{ subject.validate(params) }.to raise_error BitmapEditor::ParamsValidationError
        end
      end

      context 'validates coordinates' do
        let(:params) { [1, 0, 'C'] }

        it 'should raise error when coordinates are not in range 1 to 250' do
          expect{ subject.validate(params) }.to raise_error BitmapEditor::CoordinateValidationError
        end
      end

      context 'validates colour' do
        let(:params) { [1, 2, 3] }

        it 'should raise error when not correct format of colour' do
          expect{ subject.validate(params) }.to raise_error BitmapEditor::ValidationError
        end
      end

      context 'validates dimension' do
        let(:params) { [4, 2, 'C'] }

        it 'should raise error when coordinates are bigger than canvass' do
          expect{ subject.validate(params) }.to raise_error BitmapEditor::DimensionValidationError
        end
      end

      context 'passing validation' do
        it 'should not raise any errors when validation satisfied' do
          expect( subject.validate(params) ).to be_nil
        end
      end
    end

  end

  describe '#Perform' do
    subject { BitmapEditor::Operations::FillRegion.new(bitmap,params).perform }

    it 'should change pixels value on perform' do
      expect{ subject }.to change{ bitmap.pixels[2][1] }.from('O').to('C')
    end
  end

end
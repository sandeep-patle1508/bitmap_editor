require 'spec_helper'

describe BitmapEditor::Operations::Insert do

  let(:params) { [3,4] }
  let(:bitmap) { BitmapEditor::Bitmap.new }
  let(:new_bitmap) {[['O','O','O'],['O','O','O'],['O','O','O'],['O','O','O']]}

  #### INSTANCE METHODS

  describe 'Initialize' do
    subject { BitmapEditor::Operations::Insert.new(bitmap, params) }
    it { is_expected.to be_instance_of BitmapEditor::Operations::Insert }

    describe '#Validate' do

      context 'validates too many params' do
        let(:params) { [1, 2, 3] }

        it 'should return raise error when too many parameters' do
          expect{ subject.validate(params) }.to raise_error BitmapEditor::ParamsValidationError
        end
      end

      context 'validates too few params' do
        let(:params) { [1] }
        
        it 'should return raise error when not enough parameters' do
          expect{ subject.validate(params) }.to raise_error BitmapEditor::ParamsValidationError
        end
      end

      context 'validates dimension' do
        let(:params) { [251, 251] }

        it 'should raise error when exceed max allowed size' do
          expect{ subject.validate(params) }.to raise_error BitmapEditor::ValidationError
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
    subject { BitmapEditor::Operations::Insert.new(bitmap,params).perform }

    it 'should change pixels value upon perform' do
      expect{ subject }.to change{ [bitmap.width, bitmap.height, bitmap.pixels] }.to([3, 4, new_bitmap])
    end
  end

end
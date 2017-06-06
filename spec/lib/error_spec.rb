require 'spec_helper'

describe BitmapEditor::Error do
  it { is_expected.to be_a(StandardError) }
end

describe BitmapEditor::ValidationError do
  
  context 'without args' do
    subject { BitmapEditor::ValidationError.new }

    it 'should return a particular error message' do
      expect( subject.message ).to include('Validation error')
    end
  end

  context 'with args' do
    subject { BitmapEditor::ValidationError.new 'error_message' }

    it 'should accept an argument' do
      expect( subject.message ).to include('Validation error: error_message')
    end
  end
end

describe BitmapEditor::DimensionValidationError do
  subject { BitmapEditor::DimensionValidationError.new(3, 4) }

  it { is_expected.to be_a(BitmapEditor::DimensionValidationError) }

  it 'should return a particular error message' do
    expect( subject.message ).to include('Validation error: accepted range for x-axis is 1 to 3, y-axis 1 to 4')
  end
end

describe BitmapEditor::ParamsValidationError do
  subject { BitmapEditor::ParamsValidationError.new(3, 4) }

  it { is_expected.to be_a(BitmapEditor::ParamsValidationError) }

  it 'should return a particular error message' do
    expect( subject.message ).to include('Validation error: 3 params for 4')
  end
end

describe BitmapEditor::InvalidCommand do
  subject { BitmapEditor::InvalidCommand.new 'I' }

  it { is_expected.to be_a(BitmapEditor::InvalidCommand) }

  it 'should return a particular error message' do
    expect( subject.message ).to include('Invalid command: I')
  end
end
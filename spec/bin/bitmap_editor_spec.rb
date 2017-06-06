require 'spec_helper'

describe 'bitmap editor command' do

  let(:input_file) { File.expand_path('../support/show.txt', File.dirname(__FILE__)) }
  subject { BitmapEditor::App.new.run(input_file) }

  it "should run and initiated bitmap editor" do
    expect( subject ).to_not be false
  end

end
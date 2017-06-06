module BitmapEditor
  class App
    attr_accessor :bitmap

    # Initialize App Class.
	#
	# Initialize Bitmap object
    def initialize
      @bitmap = BitmapEditor::Bitmap.new
    end

    # Read file line by line
  	# Run the command got from each line
    def run(file)
      return print "please provide correct file" if file.nil? || !File.exists?(file)

      File.open(file).each do |line|
        keys = line.chomp.split

        case keys.first
        when 'S'
            printf BitmapEditor::Command.new(bitmap, keys).execute
        else
            BitmapEditor::Command.new(bitmap, keys).execute
        end
      end
    end
  end
end

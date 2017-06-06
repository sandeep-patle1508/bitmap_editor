module BitmapEditor
  class Bitmap

  	attr_accessor :height, :width, :pixels

  	# Initialize Bitmap.
  	#
  	# @width width of the bitmap
  	# @height height of the bitmap
    def initialize width=0, height=0
      @width = width
      @height = height
      @pixels = Array.new
    end

    # returns [Hash[Array]] represents pixels in each rows of the bitmap
    def generate_pixels
      @pixels = Array.new(@height) { Array.new(@width) { 'O' } }
    end

    # returns [Integer] of the bitmap's dimension
    def dimension
      @dimension = @width * @height
    end

  end
end
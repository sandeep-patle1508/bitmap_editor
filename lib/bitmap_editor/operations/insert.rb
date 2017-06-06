module BitmapEditor
  module Operations
    class Insert

      # initialize
      # assign additional vars
      def initialize bitmap, params
        @bitmap = bitmap
        @x_axis = params[0].to_i
        @y_axis = params[1].to_i
        validate(params)
      end

      # returns [Boolean] True when validation passed
      def validate params
        validate_params(params)
        validate_dimension
      end

      # perform insert
      # create the Bitmap with given width and height
      def perform
        @bitmap.width  = @x_axis
        @bitmap.height = @y_axis
        @bitmap.generate_pixels
      end

      # validate input params
      def validate_params(params)
        fail ParamsValidationError.new(params.count,2) unless params.count == 2
      end

      # validate co-ordinates range value
      def validate_dimension
        fail ValidationError.new('accepted range is between 1 and 250') unless [@x_axis, @y_axis].all? {|num| num > 0 && num <= 250 }
      end

    end
  end
end
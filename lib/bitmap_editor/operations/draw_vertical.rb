module BitmapEditor
  module Operations
    class DrawVertical < Base

      # initialize
      # assign additional vars
      def initialize bitmap, params
        @bitmap = bitmap
        @x_axis   = params[0].to_i
        @y_axis_1 = params[1].to_i
        @y_axis_2 = params[2].to_i
        @color   = params[3].to_s
        validate(params)
      end

      # returns [Boolean] True when validation passed
      def validate params
        validate_params(params)
        validate_coordinates
        validate_color
        validate_dimension
      end

      def perform
        min, max = [@y_axis_1, @y_axis_2].sort
        (min..max).to_a.each {|i| @bitmap.pixels[i-1][@x_axis-1] = @color }
      end

      def validate_params params
        fail ParamsValidationError.new(params.count,4) unless params.count == 4
      end

      def validate_coordinates
        fail CoordinateValidationError.new unless [@x_axis, @y_axis_1, @y_axis_2].all? {|num| num.between? 1,250 }
      end

      def validate_dimension
        fail DimensionValidationError.new(@bitmap.width, @bitmap.height) unless
          @x_axis <= @bitmap.width && @y_axis_1 <= @bitmap.height && @y_axis_2 <= @bitmap.height
      end

    end
  end
end
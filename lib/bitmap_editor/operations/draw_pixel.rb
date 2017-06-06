module BitmapEditor
  module Operations
    class DrawPixel < Base

      # initialize
      # assign additional vars
      def initialize bitmap, params
        @bitmap = bitmap
        @x_axis = params[0].to_i
        @y_axis = params[1].to_i
        @color = params[2].to_s
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
        @bitmap.pixels[@y_axis-1][@x_axis-1] = @color
      end

      def validate_params(params)
        fail ParamsValidationError.new(params.count, 3) unless params.count == 3
      end

      def validate_coordinates
        fail CoordinateValidationError.new unless [@x_axis, @y_axis].all? {|num| num.between? 1,250 }
      end

      def validate_dimension
        fail DimensionValidationError.new(@bitmap.width, @bitmap.height) unless
          @x_axis <= @bitmap.width && @y_axis <= @bitmap.height
      end
    end
  end
end
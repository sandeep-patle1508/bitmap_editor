module BitmapEditor
  module Operations
    class FillRegion < Base

      # initialize
      # assign additional vars
      def initialize bitmap, params
        @bitmap = bitmap
        @x_axis = params[0].to_i - 1
        @y_axis = params[1].to_i - 1
        @color = params[2].to_s
        validate(params)

        @original_color = @bitmap.pixels[@y_axis][@x_axis]
      end

      # returns [Boolean] True when validation passed
      def validate params
        validate_params(params)
        validate_coordinates
        validate_color
        validate_dimension
      end      

      def perform
        fill_region(@x_axis, @y_axis)
      end

      def fill_region x_axis, y_axis
        return unless valid_dimension?(x_axis, y_axis) && @bitmap.pixels[y_axis][x_axis] == @original_color
        @bitmap.pixels[y_axis][x_axis] = @color

        # go to right, left, uo and down
        [[1,0], [-1, 0], [0, 1], [0, -1]].each { |x, y| fill_region(x_axis + x, y_axis + y) }
      end

      def valid_dimension? x_axis,y_axis
        x_axis < @bitmap.width && y_axis < @bitmap.height
      end

      def validate_params params
        fail ParamsValidationError.new(params.count, 3) unless params.count == 3
      end

      def validate_coordinates
        fail CoordinateValidationError.new unless [@x_axis, @y_axis].all? {|num| num.between?(0, 250) }
      end

      def validate_dimension
        fail DimensionValidationError.new(@bitmap.width, @bitmap.height) unless valid_dimension?(@x_axis, @y_axis)
      end

    end
  end
end
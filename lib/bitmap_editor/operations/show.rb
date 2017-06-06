module BitmapEditor
  module Operations
    class Show

      # initialize
      # assign additional vars
      def initialize bitmap, params
        @bitmap = bitmap
        validate(params)
      end

      # returns [Boolean] True when validation passed
      def validate params
        fail ParamsValidationError.new(params.count,0) unless params.empty?
      end

      # perform insert
      # show the Bitmap
      def perform
        @bitmap.pixels.inject('') { |res, col| res = res + (col.join + "\n") }
      end
      
    end
  end
end
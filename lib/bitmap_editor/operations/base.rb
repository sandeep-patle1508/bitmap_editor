module BitmapEditor
  module Operations
    class Base

      def validate_color
        fail ValidationError.new('colors are specified by single capital letter') if @color.match(/^[A-Z]$/).nil?
      end

    end
  end
end
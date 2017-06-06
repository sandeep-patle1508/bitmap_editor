module BitmapEditor
  class Error < StandardError; end

  class ValidationError < Error
    def initialize msg=nil
      super(['Validation error', msg].compact.join(': '))
    end
  end

  class CoordinateValidationError < Error
    def initialize
      super('Validation error: accepted pixel coordinates is between 1 to 250')
    end
  end

  class DimensionValidationError < Error
    def initialize width=250, height=250
      super("Validation error: accepted range for x-axis is 1 to #{width}, y-axis 1 to #{height}")
    end
  end

  class ParamsValidationError < Error
    def initialize input, keys
      super("Validation error: #{input} params for #{keys}")
    end 
  end

  class InvalidCommand < Error
    def initialize key
      super("Invalid command: #{key}")
    end
  end
end
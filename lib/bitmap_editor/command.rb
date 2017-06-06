module BitmapEditor
  class Command

    attr_reader :key, :params, :bitmap

    ACTIONS = {
      I: 'Insert',
      C: 'Clear',
      L: 'DrawPixel',
      V: 'DrawVertical',
      H: 'DrawHorizontal',
      S: 'Show'
    }

    # initialize
    #
    # @bitmap to hold the instance of bitmap
    # @key hold the command
    # @params hold the co-ordinates values and color
    def initialize bitmap, keys
      @bitmap = bitmap
      @key    = keys.shift
      @params = keys
    end

    # returns [BitmapEditorError] when validation failed
    # returns [BitmapEditor::Command] when validation passed
    def execute
      fail BitmapEditor::InvalidCommand.new(@key) unless ACTIONS.keys.include? @key.to_sym
      Object.const_get("BitmapEditor::Operations::#{ACTIONS[@key.to_sym]}").new(@bitmap, @params).perform
    end

  end
end
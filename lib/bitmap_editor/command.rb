module BitmapEditor
  class Command

    attr_reader :key, :params, :bitmap

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

    def execute; end

  end
end
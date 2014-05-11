# encoding: utf-8

class ArrayContext
  attr_reader :receiver

  def initialize(receiver)
    @receiver = receiver
  end

  def method_missing(method_name, *args , &block)
    if args.size > 0
      receiver.map do |value|
        value.send method_name, *args
      end
    else
      receiver.map do |value|
        value.send method_name
      end
    end
  end

  def to_a
    @receiver
  end
end

# Array
class Array
  # return ArrayContext for each execute
  #
  # === Example
  #
  #   [*'a'..'c'].>>.ord # => [97, 98, 99]
  #   [*'a'..'c'].>>.'ord' # => [97, 98, 99]
  #   [*'aa'..'cc'].>>.gsub("a", "c") # => ['cc', 'cb', 'cc']
  #
  def >>(dummy = nil)
    ArrayContext.new(self)
  end
end

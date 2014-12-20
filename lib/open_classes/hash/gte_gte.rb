# encoding: utf-8

# HashContext
class HashContext
  attr_reader :receiver
  def initialize(receiver)
    @receiver = receiver
  end

  def method_missing(method_name, *args, &block)
    result = nil
    if args.size > 0
      receiver.reduce({}) do |ret, (key, value)|
        value = value.send method_name, *args
        ret[key] = value
        ret
      end
    else
      receiver.reduce({}) do |ret, (key, value)|
        value = value.send method_name
        ret[key] = value
        ret
      end
    end
  end

  def to_h
    @receiver
  end
end

# Hash
class Hash
  # return HashContext for each execute
  #
  # === Example
  #
  #   h = {key1: "value1", key2: "value2"}
  #   h.>>.upcase # => {key1: "VALUE1", key2: "VALUE2"}
  #   h.>>.+('_hoge') # => {key1: "value1_hoge", key2: "value2_hoge"}
  #
  def >>(dummy = nil)
    HashContext.new(self)
  end
end

# encoding: utf-8

# Object
class Object
  # you get bool value
  #
  #   true.to_bool # => true
  #   false.to_bool # => false
  #   0.to_bool # => true
  #   1.to_bool # => true
  #   ''.to_bool # => true
  #   'true'.to_bool # => true
  #   'false'.to_bool # => true
  #   nil.to_bool # => false
  def to_bool
    !!self # rubocop:disable DoubleNegation
  end
end

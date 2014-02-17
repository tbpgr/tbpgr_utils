# encoding: utf-8

# Object
class Object
  # Check boolean type
  #
  #   boolean? true # => true
  #   boolean? false # => true
  #   boolean? nil # => false
  #   boolean? 'true' # => false
  #   boolean? 'false' # => false
  #   boolean? '' # => false
  def boolean?
    self.is_a?(TrueClass) || self.is_a?(FalseClass)
  end
end

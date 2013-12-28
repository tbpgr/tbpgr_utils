# encoding: utf-8

# =Object
class Object
  # == check boolean type
  def boolean?
    self.is_a?(TrueClass) || self.is_a?(FalseClass)
  end

  # ==get self define methods.
  def my_methods
    public_methods(false) + protected_methods(false) + private_methods(false)
  end
end

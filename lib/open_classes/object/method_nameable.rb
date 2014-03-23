# encoding: utf-8

# Object
class Object
  # object can use method name or not
  #
  #   "string".method_nameable # => true
  #   :symbol.method_nameable # => true
  #   1.method_nameable # => false
  #
  def method_nameable?
    [String, Symbol].include? self.class
  end
end

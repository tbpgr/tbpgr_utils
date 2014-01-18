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

  # Get self define methods.
  #
  #   class SampleClass < String
  #     def public_hello
  #       "public hello"
  #     end
  #
  #     protected
  #
  #     def protected_hello
  #       "protected hello"
  #     end
  #
  #     private
  #
  #     def private_hello
  #       "private hello"
  #     end
  #   end
  #
  #   SampleClass.new.my_methods # => [:public_hello, :protected_hello, :private_hello]
  def my_methods
    public_methods(false) + protected_methods(false) + private_methods(false)
  end

  # If self match any one of args, return true.
  #
  #   "hoge".any_of? %w{hoge hige} # => true
  #   "hige".any_of? %w{hoge hige} # => true
  #   "hege".any_of? %w{hoge hige} # => false
  def any_of?(*args)
    args.each { |value|return true if self == value }
    false
  end

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
    !!self
  end
end

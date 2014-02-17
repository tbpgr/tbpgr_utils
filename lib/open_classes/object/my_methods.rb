# encoding: utf-8

# Object
class Object
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
end

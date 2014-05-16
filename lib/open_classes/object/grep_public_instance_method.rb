# encoding: utf-8

# Object
class Object
  # grep public instance method
  #
  # === Example
  #
  # target class
  #
  #   class GrepPublicInstanceMethod
  #     def public_method1;end
  #     def public_method2;end
  #     def public_method11;end
  #     protected
  #     def protected_method1;end
  #     def protected_method2;end
  #     def protected_method11;end
  #     private
  #     def private_method1;end
  #     def private_method2;end
  #     def private_method11;end
  #   end
  #
  #  method call
  #
  #   GrepPublicInstanceMethod.new.grep_public_instance_method :public_method1, false # => [:public_method1]
  #   GrepPublicInstanceMethod.new.grep_public_instance_method /public_method1/, false # => [:public_method1, :public_method11]
  #   GrepPublicInstanceMethod.new.grep_public_instance_method /public_method3/, false # => []
  #   GrepPublicInstanceMethod.new.grep_public_instance_method :equal?, true # => [:equal?]
  #
  def grep_public_instance_method(search, all = true)
    search = search.to_sym unless search.is_a? Regexp
    public_methods(all).grep search
  end
end

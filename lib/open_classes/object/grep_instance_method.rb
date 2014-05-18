# encoding: utf-8

# Object
class Object
  # grep public instance method
  #
  # === Example
  #
  # target class
  #
  #   class GrepInstanceMethod
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
  #   GrepInstanceMethod.new.grep_public_instance_method :public_method1, false # => [:public_method1]
  #   GrepInstanceMethod.new.grep_public_instance_method /public_method1/, false # => [:public_method1, :public_method11]
  #   GrepInstanceMethod.new.grep_public_instance_method /public_method3/, false # => []
  #   GrepInstanceMethod.new.grep_public_instance_method :equal?, true # => [:equal?]
  #

  %w(public protected private).each do |scope|
    define_method :"grep_#{scope}_instance_method" do |search, all = true|
      search = search.to_sym unless search.is_a? Regexp
      each_methods = send :"#{scope}_methods", all
      each_methods.grep search
    end
  end
end

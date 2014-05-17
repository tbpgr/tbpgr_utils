# encoding: utf-8

# Object
class Object
  def self.grep_method(search, all = true)
    search = search.to_sym unless search.is_a? Regexp
    methods(all).grep search
  end

  # grep public instance method
  #
  # === Example
  #
  # target class
  #
  #   class GrepMethod
  #     def self.public_method1;end
  #     def self.public_method2;end
  #     def self.public_method11;end
  #     protected
  #     def self.protected_method1;end
  #     def self.protected_method2;end
  #     def self.protected_method11;end
  #     private
  #     def self.private_method1;end
  #     def self.private_method2;end
  #     def self.private_method11;end
  #   end
  #
  #  method call
  #
  #   GrepMethod.new.grep_method :public_method1, false # => [:public_method1]
  #   GrepMethod.grep_method :public_method1, false # => [:public_method1]
  #   GrepMethod.new.grep_method /public_method1/, false # => [:public_method1, :public_method11]
  #   GrepMethod.grep_method /public_method1/, false # => [:public_method1, :public_method11]
  #   GrepMethod.new.grep_method /public_method3/, false # => []
  #   GrepMethod.grep_method /public_method3/, false # => []
  #   GrepMethod.new.grep_method :__send__, true # => [:__send__]
  #   GrepMethod.grep_method :__send__, true # => [:__send__]
  #
  def grep_method(search, all = true)
    self.class.grep_method(search, all)
  end
end

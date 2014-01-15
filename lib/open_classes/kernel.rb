# encoding: utf-8

# Kernel
module Kernel
  # Print code + eval result
  #
  #  print_eval 8/4, binding  # => 8/4 # => 2
  #  message = 'msg';print_eval "hoge-#{message}", binding # => "hoge-#{message}" # => "hoge-msg"
  def print_eval(code, binding)
    print exec_eval code, binding
  end

  # Puts code + eval result
  #
  #  puts_eval 8/4, binding  # => 8/4 # => 2\n
  #  message = 'msg';puts_eval "hoge-#{message}", binding # => "hoge-#{message}" # => "hoge-msg"\n
  def puts_eval(code, binding)
    puts exec_eval code, binding
  end

  # define methods to classes. methods have simple return value.
  #
  #   bulk_define_methods [NilClass, FalseClass], :blank?, true
  #   bulk_define_methods [TrueClass, Numeric], "blank?", false
  #
  #   puts nil.blank?   # => true
  #   puts false.blank? # => true
  #   puts true.blank?  # => false
  #   puts 1.blank?     # => false
  #
  #   bulk_define_methods [NilClass, FalseClass], [:blank?, :present?], [true, false]
  #   bulk_define_methods [TrueClass, Numeric], [:blank?, :present?], [false, true]
  #
  #   puts nil.blank?     # => true
  #   puts nil.present?   # => false
  #   puts false.blank?   # => true
  #   puts false.present? # => false
  #   puts true.blank?    # => false
  #   puts true.present?  # => true
  #   puts 1.blank?       # => false
  #   puts 1.present?     # => true
  #
  # bulk_define_methods NilClass, :blank?, true is same as following code
  #
  #   class NilClass
  #     def blank?
  #       true
  #     end
  #   end
  def bulk_define_methods(classes, methods, constants)
    validate_bulk_define_classes!(classes)
    validate_bulk_define_methods!(methods)
    size = get_classes_size(classes)
    tmp_classes = fill_same_values(classes, size)
    tmp_methods = fill_same_values(methods, size)
    tmp_constants = fill_same_values(constants, size)
    tmp_classes.each do |klass|
      define_method_constants(klass, tmp_methods, tmp_constants)
    end
  end

  private
  def get_classes_size(classes)
    size = classes.is_a?(Array) ? classes.size : 1
  end

  def fill_same_values(ary, size)
    return ary if ary.is_a?(Array)
    tmp = []
    size.times {tmp << ary}
    tmp
  end

  def validate_bulk_define_classes!(classes)
    return if classes.class.any_of?(Array, Class)
    fail TypeError, "invalid type #{a.class}. you have to use Array or Class or String or Symbol"
  end

  def validate_bulk_define_methods!(methods)
    return if methods.class.any_of?(Array, String, Symbol)
    fail TypeError, "invalid type #{a.class}. you have to use Array or Class or String or Symbol" 
  end

  def define_method_constants(klass, methods, constants)
    methods.each_with_index do |m, i|
      klass.class_eval do
        define_method m do |*args|
          constants[i]
        end
      end
    end
  end

  def exec_eval(code, binding)
    ret = eval code, binding
    "#{code} # => #{ret.inspect}"
  end
end

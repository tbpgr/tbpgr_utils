# encoding: utf-8

# Enumerable
module Enumerable
  # alias of map {|v|send :some_kernel_method, v}
  #
  # === Example
  #
  #   [*1..3].kernel_send:Rational # => [(1/1), (2/1), (3/1)]
  #
  def kernel_send(method_name)
    return self unless [Symbol, String].include? method_name.class
    map { |v|send method_name.to_sym, v }
  end
end

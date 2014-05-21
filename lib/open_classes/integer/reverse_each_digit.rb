# encoding: utf-8

class Integer
  # provide reverse iterator for number's each digit
  #
  # === Example
  #
  #   ret=[];12345.reverse_each_digit { |v|ret << v+1 };print ret # => [6, 5, 4, 3, 2]
  #
  def reverse_each_digit
    abs.to_s.split('').reverse.map { |v|v.to_i }.each { |v|yield(v) }
  end
end

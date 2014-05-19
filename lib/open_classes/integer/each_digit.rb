# encoding: utf-8

class Integer
  # provide iterator for number's each digit
  #
  # === Example
  #
  #   ret=[];12345.each_digit { |v|ret << v+1 };print ret # => [2,3,4,5,6]
  #
  def each_digit
    abs.to_s.split('').map { |v|v.to_i }.each { |v|yield(v) }
  end
end

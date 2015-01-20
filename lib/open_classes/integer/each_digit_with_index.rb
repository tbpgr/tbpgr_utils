# encoding: utf-8

class Integer
  # provide iterator for number's each digit with index
  #
  # === Example
  #
  #   ret=[];12_345.each_digit_with_index { |v, i|ret << v + i };print ret # => [1, 3, 5, 7, 9]
  #
  def each_digit_with_index
    abs.to_s.each_char.map(&:to_i).each_with_index { |v, i|yield(v, i) }
  end
end

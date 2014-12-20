# encoding: utf-8

# Array
class Array
  # return average
  #
  # === Example
  #
  #   [*1..6].average # => 3.5
  #   [1.5, 2.5].average # => 2.0
  #   [*'a'..'z'].average # => raise TypeError
  #
  def average
    fail TypeError, 'you have to use elements that is Numeric' unless all? { |v|v.is_a? Numeric }
    sum.to_f / size
  end
end

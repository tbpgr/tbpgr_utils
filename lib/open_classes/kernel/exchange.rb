# encoding: utf-8

# Kernel
module Kernel
  # exchange variable a for b
  #
  # === Example
  #
  #   a = 1
  #   b = 2
  #   a, b = exchange(a, b)
  #   a # => 2
  #   b # => 1
  #
  def exchange(one, other)
    tmp = one
    one = other
    other = tmp
    [one, other]
  end
end

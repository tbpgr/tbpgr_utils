# encoding: utf-8

# Enumerable
module Enumerable
  # alias of Enumerable#reduce(&:+)
  #
  # === Example
  #
  #   [*1..5].reduce(&:+) # => 15
  #   [*'a'..'z'].reduce(&:+) # => 'abcdefghijklmnopqrstuvwxyz'
  #
  def sum
    reduce(&:+)
  end
end

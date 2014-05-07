# encoding: utf-8

# Array
class Array
  # alias of Array#reduce(&:+)
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

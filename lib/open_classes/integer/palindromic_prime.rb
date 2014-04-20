# encoding: utf-8
require 'prime'

class Integer
  # Returns true if value is palindromic prime, false for a composite.
  #
  # === Example
  #
  #   0.palindromic_prime? # => false
  #   1.palindromic_prime? # => false
  #   2.palindromic_prime? # => true
  #   11.palindromic_prime? # => true
  #   757.palindromic_prime? # => true
  #   758.palindromic_prime? # => false
  #
  def palindromic_prime?
    prime? && to_s == to_s.reverse
  end
end

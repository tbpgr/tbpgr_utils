# encoding: utf-8

# String
class String
  # return uniq size
  #
  # === Example
  #
  #   'abcdefa'.uniq_size # => 6
  #   'abcdef'.uniq_size # => 6
  #   ''.uniq_size # => 0
  #
  def uniq_size
    split('').uniq.size
  end
end

# encoding: utf-8

# Array
class Array
  # return uniq size
  #
  # === Example
  #
  #   ([*1..6] + [2,3]).uniq_size # => 6
  #   [*1..6].uniq_size # => 6
  #   [].uniq_size # => 0
  #
  def uniq_size
    uniq.size
  end
end

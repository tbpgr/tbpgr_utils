# encoding: utf-8

# Array
class Array
  # exchange arrays elements
  #
  # === Example
  #
  #   [*1..6].exchange!(1, 5) # => [1, 6, 3, 4, 5, 2]
  #   [*1..6].exchange!(1, -1) # => [1, 6, 3, 4, 5, 2]
  #   [*1..6].exchange!(1, 6) # => [*1..6]
  #   [].exchange!(1, 2) # => []
  #
  def exchange!(one_index, other_index)
    return self unless one_index.respond_to? :to_i
    return self unless other_index.respond_to? :to_i
    one_index = one_index.to_i
    other_index = other_index.to_i
    return self if one_index.abs >= size
    return self if other_index.abs >= size
    tmp_one = self[one_index]
    self[one_index] = self[other_index]
    self[other_index] = tmp_one
    self
  end
end

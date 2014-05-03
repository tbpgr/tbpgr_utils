# encoding: utf-8

# Array
class Array
  # alias of map(&:method_symbol)
  #
  # === Example
  #
  #   [*'a'..'c']>>:ord # => [97, 98, 99]
  #
  def >>(method_name)
    return self unless [Symbol, String].include? method_name.class
    map(&method_name.to_sym)
  end
end

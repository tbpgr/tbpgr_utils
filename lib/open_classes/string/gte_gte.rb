# encoding: utf-8

# String
class String
  # self converto to Array. and applya operator to execute elements
  #
  # === Example
  #
  #   "abc">>:ord # => [97, 98, 99]
  #   "abc">>'ord' # => [97, 98, 99]
  #   "abc">>-> (x) { (x.ord + 1).chr } # => ["c", "d", "e"]
  #
  def >>(method_name)
    return self unless [Symbol, String, Proc].include? method_name.class
    if method_name.is_a? Proc
      split('').map { |v|method_name[v] }
    else
      split('').map(&method_name.to_sym)
    end
  end
end

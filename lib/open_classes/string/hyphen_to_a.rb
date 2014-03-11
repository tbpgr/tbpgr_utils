# encoding: utf-8

# String
class String
  # hyphen-format string to array.
  #
  # ==== Examples
  #
  # number case
  #
  #   '1-5'.hyphen_to_a # => [1, 2, 3, 4, 5]
  #
  # alphabet case
  #
  #   '"a"-"e"'.hyphen_to_a # => ['a', 'b', 'c', 'd', 'e']
  #
  def hyphen_to_a
    return self unless self.include? '-'
    return self unless count('-') == 1
    eval "[*#{gsub('-', '..')}]", binding
  end
end

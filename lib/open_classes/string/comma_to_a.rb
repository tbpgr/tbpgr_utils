# encoding: utf-8

# String
class String
  # comma-format string to array.
  #
  # ==== Examples
  #
  # space commma case
  #
  #   '1, 5, 9'.comma_to_a # => ["1", "5", "9"]
  #
  # commma case
  #
  #   '1,5,9'.comma_to_a # => ["1", "5", "9"]
  #
  def comma_to_a
    return self unless self.include? ','
    gsub(' ', '').split(',')
  end
end

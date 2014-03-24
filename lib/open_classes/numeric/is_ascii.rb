# encoding: utf-8

# Numeric
class Numeric
  # return is ascii or not
  #
  # ==== Examples
  #
  # 1,127,128 case
  #
  #   1.is_ascii? # => return true
  #   127.is_ascii? # => return true
  #   128.is_ascii? # => return false
  #
  def is_ascii?
    self < 128
  end
end

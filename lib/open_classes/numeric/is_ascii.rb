# encoding: utf-8

# Numeric
class Numeric
  # return is ascii or not
  #
  # ==== Examples
  #
  # 1,127,128 case
  #
  #   1.ascii? # => return true
  #   127.ascii? # => return true
  #   128.ascii? # => return false
  #
  def ascii?
    self < 128
  end
end

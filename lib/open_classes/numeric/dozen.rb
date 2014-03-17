# encoding: utf-8

# Numeric
class Numeric
  # get dozen number
  #
  # ==== Examples
  #
  # 0,1,2 case
  #
  #   0.dozen # => return 0
  #   1.dozen # => return 12
  #   2.dozen # => return 24
  #
  def dozen
    return 0 if self == 0
    self * 12
  end
end

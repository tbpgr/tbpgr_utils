# encoding: utf-8

# Numeric
class Numeric
  # dice number mappings
  DICE = { 1 => 6, 2 => 5, 3 => 4, 4 => 3, 5 => 2, 6 => 1 }

  # return dice back number
  #
  # ==== Examples
  #
  # each 1-6 case
  #
  #   1.dice_back # => return 6
  #   2.dice_back # => return 5
  #   3.dice_back # => return 4
  #   4.dice_back # => return 3
  #   5.dice_back # => return 2
  #   6.dice_back # => return 1
  #
  # other case
  #
  #   7.dice_back # => return 7
  #
  def dice_back
    DICE.include?(self) ? DICE[self] : self
  end
end

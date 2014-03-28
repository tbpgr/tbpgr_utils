# encoding: utf-8

# Numeric
class Numeric
  # return is binary table
  #
  # ==== Examples
  #
  # 1 to 3 case
  #
  #   Numeric.to_binary_table(1, 3)
  #
  # result
  #
  #   |10digit|2digit  |
  #   |1      |00000001|
  #   |2      |00000010|
  #   |3      |00000011|
  #
  def self.to_binary_table(from = 1, to = 10)
    ret = []
    size = to.to_s(2).size - 1
    pad = (size / 8 + 1) * 8
    ret << '|10digit|2digit|'
    (from..to).each { |i|ret << "|#{i}|#{i.to_s(2).rjust(pad, '0')}|" }
    joined = ret.join("\n") + "\n"
    joined.justify_table(:right)
  end
end

# encoding: utf-8

# Numeric
class Numeric
  # return is digit table
  #
  # ==== Examples
  #
  # 255 to 256 case
  #
  #   Numeric.to_digit_table(255, 256)
  #
  # result
  #
  #   |10digit|          2digit|8digit|16digit|
  #   |    255|0000000011111111|   377|   00ff|
  #   |    256|0000000100000000|   400|   0100|
  #
  def self.to_digit_table(from = 1, to = 10)
    ret = []
    binary_size = to.to_s(2).size - 1
    binary_pad = (binary_size / 8 + 1) * 8
    oct_size = to.to_s(8).size
    hex_size = to.to_s(16).size - 1
    hex_pad = (hex_size / 4 + 1) * 4
    ret << '|10digit|2digit|8digit|16digit|'
    (from..to).each { |i|ret << "|#{i}|#{i.to_s(2).rjust(binary_pad, '0')}|#{i.to_s(8).rjust(oct_size, '0')}|#{i.to_s(16).rjust(hex_pad, '0')}|" }
    joined = ret.join("\n") + "\n"
    joined.justify_table(:right)
  end
end

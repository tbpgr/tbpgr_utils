# encoding: utf-8

# Numeric
class Numeric
  # return is hex table
  #
  # ==== Examples
  #
  # 65535 to 65536 case
  #
  #   Numeric.to_binary_table(65535, 65536)
  #
  # result
  #
  #   |10digit| 16digit|
  #   |  65535|0000ffff|
  #   |  65536|00010000|
  #
  def self.to_hex_table(from = 1, to = 10)
    ret = []
    size = to.to_s(16).size - 1
    pad = (size / 4 + 1) * 4
    ret << '|10digit|16digit|'
    (from..to).each { |i|ret << "|#{i}|#{i.to_s(16).rjust(pad, '0')}|" }
    joined = ret.join("\n") + "\n"
    joined.justify_table(:right)
  end
end

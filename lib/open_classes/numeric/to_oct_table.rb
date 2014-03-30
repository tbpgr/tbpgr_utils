# encoding: utf-8

# Numeric
class Numeric
  # return is oct table
  #
  # ==== Examples
  #
  # 65535 to 65536 case
  #
  #   Numeric.to_oct_table(65535, 65536)
  #
  # result
  #
  #   |10digit|8digit|
  #   |  65535|177777|
  #   |  65536|200000|
  #
  def self.to_oct_table(from = 1, to = 10)
    ret = []
    size = to.to_s(8).size
    ret << '|10digit|8digit|'
    (from..to).each { |i|ret << "|#{i}|#{i.to_s(8).rjust(size, '0')}|" }
    joined = ret.join("\n") + "\n"
    joined.justify_table(:right)
  end
end

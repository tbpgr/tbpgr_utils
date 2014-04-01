# encoding: utf-8
require 'open_classes/array/to_table'

# Fixnum
class Fixnum
  # return value is fixnum table
  #
  # ==== Examples
  #
  # 1 to 100 by 10 case
  #
  #   Fixnum.to_fixnum_table(1, 100, 10)
  #
  # result
  #
  #   | 1| 2| 3| 4| 5| 6| 7| 8| 9| 10|
  #   |11|12|13|14|15|16|17|18|19| 20|
  #   |21|22|23|24|25|26|27|28|29| 30|
  #   |31|32|33|34|35|36|37|38|39| 40|
  #   |41|42|43|44|45|46|47|48|49| 50|
  #   |51|52|53|54|55|56|57|58|59| 60|
  #   |61|62|63|64|65|66|67|68|69| 70|
  #   |71|72|73|74|75|76|77|78|79| 80|
  #   |81|82|83|84|85|86|87|88|89| 90|
  #   |91|92|93|94|95|96|97|98|99|100|
  #
  # 1 to 10 by 2 case
  #
  #   Fixnum.to_fixnum_table(1, 10, 2)
  #
  # result
  #
  #   |1| 2|
  #   |3| 4|
  #   |5| 6|
  #   |7| 8|
  #   |9|10|
  #
  def self.to_fixnum_table(from = 1, to = 100, return_num = 10)
    return '' unless from.is_a?(Fixnum)
    return '' unless to.is_a?(Fixnum)
    [*from..to].each_slice(return_num).to_a.to_table
  end
end

# encoding: utf-8
require 'open_classes/numeric/is_ascii'

# String
class String
  # count string size. ascii => count1, not ascii => count2
  #
  def ascii1_other2_size
    chars.to_a.reduce(0) do |sum, v|
      case v.ord
      when 65_393..65_437
        sum += 1
      when 1..127
        sum += 1
      else
        sum += 2
      end
      sum
    end
  end
end

# encoding: utf-8
require 'open_classes/numeric/is_ascii'
require 'open_classes/string/justify_table'
require 'open_classes/string/ascii1_other2_size'

# String
class String
  # get ascii_unicode_table
  #
  # === Example
  #
  # input
  #   'aあb'
  #
  # result
  #
  #   |char|ASCII|ascii2 |Unicode|
  #   | a  | 97  |1100001|  --   |
  #   | あ | --  |  --   |0x3042 |
  #   | b  | 98  |1100010|  --   |
  #
  def ascii_unicode_table
    ret = ['|char|ASCII|ascii2|Unicode|']
    chars.each do |c|
      each_ret = []
      each_ret << "|#{c}"
      if c.ord.is_ascii?
        each_ret << c.ord
        each_ret << c.ord.to_s(2)
        each_ret << '--'
      else
        each_ret << '--'
        each_ret << '--'
        each_ret << "0x#{c.ord.to_s(16)}"
      end
      ret << each_ret.join('|') + '|'
    end
    (ret.join("\n") + "\n").justify_table(:center)
  end
end

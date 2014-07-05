# encoding: utf-8
require 'open_classes/string/justify_table'

# Array
class Array
  # Array(Array, Array...) to table format.
  #
  # === Example
  #
  #   [['header1', 'header2', 'header3'],['line1_1', 'line1_2', 'line1_3']].to_table
  #
  # result
  #   |header1|header2|header3|
  #   |line1_1|line1_2|line1_3|
  #
  def to_table(position = :right)
    ret = reduce([]) do |rets, lines|
      ret = lines.reduce([]) { |a, e|a << e; a }
      rets << "|#{ret.join('|')}|"
    end.join("\n") + "\n"
    ret.justify_table(position)
  end
end

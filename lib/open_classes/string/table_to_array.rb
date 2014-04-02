# encoding: utf-8

class String
  # convert table format string to array.
  #
  # === Example
  #
  # sample case
  #
  #   BEFORE =<<-EOS
  #   |header1|header2 |header3|
  #   |line1_1| line1_2|line1_3|
  #   EOS
  #   BEFORE.table_to_array
  #
  # result
  #
  #   [["header1", "header2", "header3"], ["line1_1", "line1_2", "line1_3"]]
  #
  def table_to_array
    split("\n").map { |v|v.split('|')[1..-1].map(&:strip) }
  end
end

# encoding: utf-8
require 'open_classes/string/ascii1_other2_size'

# String
class String
  # Justify pipe using table format
  #
  # before justify
  #
  #   |* first name|* family name|
  #   |eiichiro|oda|
  #   |akira|toriyama|
  #   |yusei|matsui|
  #
  # after justify
  #
  #   |* first name|* family name|
  #   |eiichiro    |oda          |
  #   |akira       |toriyama     |
  #   |yusei       |matsui       |
  def justify_table(position = :left)
    return self if self.empty?
    max_sizes = get_column_maxes_table
    return self if max_sizes.nil?
    justify_lines_table max_sizes, position
  end

  private

  def get_column_maxes_table
    max_sizes = []
    each_line do |line|
      return nil unless table? line
      columns = get_columuns_table(line)
      max_sizes = get_column_max_table(columns, max_sizes)
    end
    max_sizes
  end

  def justify_lines_table(max_sizes, position)
    ret = []
    each_line do |line|
      columns = get_columuns_table(line)
      line_ret = []
      columns.each_with_index do |column, cnt|
        diff = column.ascii1_other2_size - column.size
        line_ret << justified_column_table(column, max_sizes[cnt], diff, position)
      end
      ret << "|#{line_ret.join('|')}|"
    end
    ret.join("\n") + "\n"
  end

  def justified_column_table(column, max_size, diff, position)
    pos = max_size - diff
    case position
    when :left
      column.ljust(pos)
    when :right
      column.rjust(pos)
    when :center
      column.center(pos)
    end
  end

  def get_columuns_table(line)
    line.split('|')[1..-2]
  end

  def get_column_max_table(columns, max_sizes)
    columns.each_with_index do |column, index|
      current_size = column.ascii1_other2_size
      # current_size = column.size
      if max_sizes[index].nil?
        max_sizes << current_size
        next
      end
      max_sizes[index] = current_size if current_size > max_sizes[index]
    end
    max_sizes
  end

  def table?(text)
    text.count('|') > 0
  end
end

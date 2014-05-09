# encoding: utf-8
require 'open_classes/string/ascii1_other2_size'

# String
class String
  # Justify string using separator
  #
  # before justify
  #
  #   print 'hoge' # => 'hoge'
  #   print 'hoge' * 2 # => 'hogehoge'
  #   print 'hoge' + 'hige' # => 'hogehige'
  #
  # after justify
  #
  #   print 'hoge'          # => 'hoge'
  #   print 'hoge' * 2      # => 'hogehoge'
  #   print 'hoge' + 'hige' # => 'hogehige'
  #
  def justify_char(separator = '|', position = :left)
    return self if empty?
    return self unless include? separator
    max_sizes = get_column_maxes(separator)
    return self if max_sizes.nil?
    justify_lines max_sizes, position, separator
  end

  private

  def get_column_maxes(separator)
    max_sizes = []
    each_line do |line|
      columns = get_columuns(line, separator)
      max_sizes = get_column_max(columns, max_sizes)
    end
    max_sizes
  end

  def justify_lines(max_sizes, position, separator)
    ret = []
    each_line do |line|
      columns = get_columuns(line, separator)
      line_ret = []
      columns.each_with_index do |column, cnt|
        diff = column.ascii1_other2_size - column.size
        line_ret << justified_column(column, max_sizes[cnt], diff, position)
      end
      ret << line_ret.join(separator).gsub(/ +$/m, '')
    end
    ret.join
  end

  def justified_column(column, max_size, diff, position)
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

  def get_columuns(line, separator)
    line.split(separator)
  end

  def get_column_max(columns, max_sizes)
    columns.each_with_index do |column, index|
      current_size = column.ascii1_other2_size
      if max_sizes[index].nil?
        max_sizes << current_size
        next
      end
      max_sizes[index] = current_size if current_size > max_sizes[index]
    end
    max_sizes
  end
end

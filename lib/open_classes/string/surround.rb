# encoding: utf-8

# String
class String
  # surround string.
  #
  # ==== Options
  #
  # * <tt>:top_bottom</tt> - set top and bottom charactor
  # * <tt>:side</tt> - set right and left charactor
  #
  # ==== Examples
  #
  # single line, no option case
  #
  #   'hoge'.surround
  #
  # result
  #
  #   ------
  #   |hoge|
  #   ------
  #
  # multi line, no option case
  #
  #   "hoge\na".surround
  #
  # result
  #
  #   ------
  #   |hoge|
  #   |a   |
  #   ------
  #
  # single line, both option case
  #
  #   'hoge'.surround top_bottom: '=', side: '!'
  #
  # result
  #
  #   ======
  #   !hoge!
  #   ======
  #
  def surround(options = { top_bottom: '-', side: '|' })
    top_bottom = init_top_bottom(options)
    side = init_side(options)
    inner_width = line_max
    top_bottom = top_bottoms(top_bottom, inner_width)
    ret = *each_line.reduce(["#{top_bottom}"]) { |ret, line|ret << "#{side}#{line.chomp.ljust(inner_width)}#{side}" }
    ret.push("#{top_bottom}").join("\n")
  end

  private

  def init_top_bottom(options)
    options[:top_bottom].nil? ? '-' : options[:top_bottom]
  end

  def init_side(options)
    options[:side].nil? ? '|' : options[:side]
  end

  def top_bottoms(top_bottom, inner_width)
    top_bottom * (inner_width + 2)
  end

  def line_max
    return 0 if self.empty?
    each_line.max_by { |v|v.size }.chomp.size
  end
end

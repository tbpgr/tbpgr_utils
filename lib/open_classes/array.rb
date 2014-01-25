# encoding: utf-8
require 'open_classes/object'
require 'open_classes/module'

# Array
class Array
  # Arrays loop together.
  #
  #   alpha = %w{one two three}
  #   numbers = %w{1 2 3}
  #   [alpha, numbers].together do |first, second|
  #     print "#{first}:#{second}\n"  # => output one:1, two:2, three:3
  #   end
  def together
    if_not_contain_array_rails_type_error
    first.each_with_index do |i_v, i|
      eval_each_str = get_args_str_for_together i
      instance_eval "yield(#{eval_each_str})"
    end
  end

  # Arrays loop together with index.
  #
  #   alpha = %w{one two three}
  #   numbers = %w{1 2 3}
  #   [alpha, numbers].together_with_index do |first, second, index|
  #     print "#{index.to_s}:#{first}:#{second}\n"  # => output 0:one:1, 1:two:2, 2:three:3
  #   end
  def together_with_index
    if_not_contain_array_rails_type_error
    first.each_with_index do |i_v, i|
      eval_each_str = get_args_str_for_together i, true
      instance_eval "yield(#{eval_each_str})"
    end
  end

  # Arrays together map.
  #
  # together_map has aliases [:tmap, :together_collect, :tcollect]
  #
  # if you want to single Array return
  #   alpha = %w{one two three}
  #   numbers = %w{1 2 3}
  #   print [alpha, numbers].together_map do |first, second|
  #     "#{first}:#{second}\n"
  #   end # => output one:1, two:2, three:3
  #
  # if you want to multi Array return
  #   alpha = %w{one two three}
  #   numbers = %w{1 2 3}
  #   print [alpha, numbers].together_map do |first, second|
  #     ["#{first}:#{second}", "#{second}:#{first}"]
  #   end # => output [['1:one', '2:two', '3:three'], ['one:1', 'two:2', 'three:3']]
  def together_map
    if_not_contain_array_rails_type_error
    ret = []
    first.each_with_index do |i_v, i|
      eval_each_str = get_args_str_for_together i
      each_ret = instance_eval "yield(#{eval_each_str})"
      ret = set_together_each_return_map(ret, each_ret, i)
    end
    ret
  end

  # Arrays loop together select.
  #
  # together_select has aliases [:tselect, :together_find_all, :tfindall]
  #
  # if you want to single Array return
  #   firsts = [1, 2, 3, 4]
  #   seconds =  [4, 2, 3, 1]
  #   ret = [firsts, seconds].together_select{|first, second|first == second}
  #   print ret # => output  [[2, 3], [2, 3]]
  #
  # if you want to multi Array return
  #   firsts = [1, 2, 3, 4]
  #   seconds =  [4, 2, 3, 1]
  #   ret = [firsts, seconds].together_select{|first, second|[first.odd?, second.even?]}
  #   print ret # => output  [[1, 3], [4, 2]]
  def together_select
    if_not_contain_array_rails_type_error
    ret = []
    first.each_with_index do |i_v, i|
      eval_each_str = get_args_str_for_together i
      each_ret = instance_eval "yield(#{eval_each_str})"
      ret = set_together_each_return_select(ret, each_ret, i)
    end
    ret
  end

  # Arrays loop together reduce.
  #
  # together_reduce has aliases [:treduce, :together_inject, :tinject]
  #
  # if you want to single return
  #   firsts = [1, 2, 3, 4]
  #   seconds =  [4, 2, 3, 1]
  #   ret = [firsts, seconds].together_reduce{|memo, first, second|memo + first + second}
  #   print ret # => output  20
  #
  # if you want to single return with init value
  #   firsts = [1, 2, 3, 4]
  #   seconds =  [4, 2, 3, 1]
  #   ret = [firsts, seconds].together_reduce(10){|memo, first, second|memo + first + second}
  #   print ret # => output  30
  #
  # if you want to single return with init string value
  #   firsts = %w{a b c}
  #   seconds =  %w{1 2 3}
  #   ret = [firsts, seconds].together_reduce('start-'){|memo, first, second|memo + first + second}
  #   print ret # => output 'start-a1b2c3'
  #
  # if you want to single return with init Array value
  #   firsts = [1, 2, 3, 4]
  #   seconds =  [4, 2, 3, 1]
  #   ret = [firsts, seconds].together_reduce([]){|memo, first, second|memo << first + second}
  #   print ret # => output [5, 4, 6, 5]
  #
  # if you want to single return with init Hash value
  #   firsts = [1, 2, 3, 4]
  #   seconds =  [4, 2, 3, 1]
  #   ret = [firsts, seconds].together_reduce({}){|memo, first, second|memo[first] = second;memo}
  #   print ret # => output {1=>4, 2=>2, 3=>3, 4=>1}
  def together_reduce(init = nil)
    if_not_contain_array_rails_type_error
    memo = initial_memo init
    first.each_with_index do |i_v, i|
      eval_each_str = get_args_str_for_together i
      memo = instance_eval "yield(memo, #{eval_each_str})"
    end
    memo
  end

  # Arrays bulk concat.
  #
  #   alpha = %w{one two three}
  #   numbers = %w{1 2 3}
  #   [alpha, numbers].together do |first, second|
  #     print "#{first}:#{second}\n"  # => output one:1, two:2, three:3
  #   end
  def together_concat(other)
    if_not_contain_array_rails_type_error
    self.each {|list|list.concat other}
  end

  private

  def if_not_contain_array_rails_type_error
    each { |f|fail TypeError, "you have to use [Array1, Array2, ...] | #{f.class} is invalid" unless f.class == Array }
  end

  def get_args_for_together(i)
    eval_each = []
    each_with_index { |j_v, j|eval_each << "self[#{j}][#{i}]" }
    eval_each
  end

  def get_args_str_for_together(i, with_index = false)
    each_eval = with_index ? get_args_for_together(i) << i : get_args_for_together(i)
    each_eval.join(',')
  end

  def set_together_each_return_map(ret, each_ret, index)
    if together_return_multi?(each_ret)
      size.times { |i|ret << [] } if index == 0
      (0..(size - 1)).each { |i|ret[i] << each_ret[i] }
    else
      ret << each_ret
    end
    ret
  end

  def set_together_each_return_select(ret, each_ret, index)
    unless together_return_multi?(each_ret)
      tmp_each_ret = []
      size.times { tmp_each_ret << each_ret }
      each_ret = tmp_each_ret
    end
    size.times { |i|ret << [] } if index == 0
    (0..(size - 1)).each { |i|ret[i] << self[i][index] if each_ret[i] }
    ret
  end

  def initial_memo(init)
    return init unless init.nil?
    first.first.is_a?(Numeric) ? 0 : first.first.is_a?(String) ? '' : nil
  end

  def together_return_multi?(list)
    (list.class == Array && list.size == size).to_bool
  end

  alias_methods [:together_collect, :tmap, :tcollect], :together_map
  alias_methods [:together_find_all, :tselect, :tfindall], :together_select
  alias_methods [:together_inject, :treduce, :tinject], :together_reduce
end

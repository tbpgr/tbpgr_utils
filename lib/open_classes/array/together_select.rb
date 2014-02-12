# encoding: utf-8
require 'open_classes/object'
require 'open_classes/module'
require 'open_classes/array/together_helper'

# Array
class Array
  include TogetherHelper

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

  private

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

  alias_methods [:together_find_all, :tselect, :tfindall], :together_select
end

# encoding: utf-8
require 'open_classes/object'
require 'open_classes/module'
require 'open_classes/array/together_helper'

# Array
class Array
  include TogetherHelper

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

  # Arrays together map!.
  #
  # together_map! has aliases [:tmap!, :together_collect!, :tcollect!]
  #
  # if you want to single Array return
  #   alpha = %w{one two three}
  #   numbers = %w{1 2 3}
  #   ary = [alpha, numbers]
  #   ret = ary.together_map! do |first, second|
  #     "#{first}:#{second}"
  #   end
  #   print ret # => output ['one:1', 'two:2', 'three:3']
  #   print ary # => output ['one:1', 'two:2', 'three:3']
  #
  # if you want to multi Array return
  #   alpha = %w{one two three}
  #   numbers = %w{1 2 3}
  #   ary = [alpha, numbers]
  #   ret = ary.together_map! do |first, second|
  #     ["#{first}:#{second}", "#{second}:#{first}"]
  #   end
  #   print ret # => output [['1:one', '2:two', '3:three'], ['one:1', 'two:2', 'three:3']]
  #   print ary # => output [['1:one', '2:two', '3:three'], ['one:1', 'two:2', 'three:3']]
  def together_map!
    if_not_contain_array_rails_type_error
    ret = []
    first.each_with_index do |i_v, i|
      eval_each_str = get_args_str_for_together i
      each_ret = instance_eval "yield(#{eval_each_str})"
      ret = set_together_each_return_map(ret, each_ret, i)
    end
    clear
    ret.each { |v|self << v }
  end

  private

  def set_together_each_return_map(ret, each_ret, index)
    if together_return_multi?(each_ret)
      size.times { |i|ret << [] } if index == 0
      (0..(size - 1)).each { |i|ret[i] << each_ret[i] }
    else
      ret << each_ret
    end
    ret
  end

  alias_methods [:together_collect, :tmap, :tcollect], :together_map
  alias_methods [:together_collect!, :tmap!, :tcollect!], :together_map!
end

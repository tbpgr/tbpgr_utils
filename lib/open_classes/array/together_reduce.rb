# encoding: utf-8
require 'open_classes/object'
require 'open_classes/module'
require 'open_classes/array/together_helper'

# Array
class Array
  include TogetherHelper

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

  def initial_memo(init)
    return init unless init.nil?
    first.first.is_a?(Numeric) ? 0 : first.first.is_a?(String) ? '' : nil
  end

  alias_methods [:together_inject, :treduce, :tinject], :together_reduce
end

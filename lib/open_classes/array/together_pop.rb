# encoding: utf-8
require 'open_classes/object'
require 'open_classes/module'
require 'open_classes/array/together_helper'

# Array
class Array
  include TogetherHelper

  # Arrays bulk pop.
  #
  # together_pop has alias :tpop
  #
  # not empty case
  #   lists = [[1, 2], [5, 6]]
  #   ret = lists.together_pop
  #   print ret # => [2, 6]
  #   print lists # => [1, 5]
  #
  # empty case
  #   lists = [[], []]
  #   ret = lists.together_pop
  #   print ret # => [nil, nil]
  #   print lists # => [[], []]
  #
  # not empty case with args
  #   lists = [[1, 2], [5, 6]]
  #   ret = lists.together_pop 2
  #   print ret # => [[1, 2], [5, 6]]
  #   print lists # => [[], []]
  #
  # not empty case with args
  #   lists = [[], []]
  #   ret = lists.together_pop 2
  #   print ret # => [[], []]
  #   print lists # => [[], []]
  def together_pop(count = nil)
    if_not_contain_array_rails_type_error
    if count.nil?
      reduce([]) { |ret, list|ret << list.pop }
    else
      reduce([]) { |ret, list|ret << list.pop(count) }
    end
  end

  alias_method :tpop, :together_pop
end

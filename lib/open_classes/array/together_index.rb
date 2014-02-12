# encoding: utf-8
require 'open_classes/object'
require 'open_classes/module'
require 'open_classes/array/together_helper'

# Array
class Array
  include TogetherHelper

  # Arrays bulk index.
  #
  # together_index has alias :tindex
  #
  # both index exist case
  #   lists = [[*1..5], [*5..9]]
  #   ret = lists.together_index 5
  #   print ret # => [4, 0]
  #
  # one include single ret case
  #   lists = [[*1..5], [*5..9]]
  #   ret = lists.together_index 4
  #   print ret # => [3, nil]
  #
  # both not include single ret case
  #   lists = [[*1..5], [*5..9]]
  #   ret = lists.together_index 10
  #   print ret # => [nil, nil]
  def together_index(value)
    if_not_contain_array_rails_type_error
    reduce([]) { |ret, list|ret << list.index(value) }
  end

  alias_method :tindex, :together_index
end

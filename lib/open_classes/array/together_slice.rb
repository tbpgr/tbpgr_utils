# encoding: utf-8
require 'open_classes/array/together_helper'

# Array
class Array
  include TogetherHelper

  # Arrays bulk slice.
  #
  # together_slice has alias :tslice
  #
  # === Examples
  #
  # single args case
  #
  #   lists = [[*1..5], [*6..10]]
  #   ret = lists.together_slice 2
  #   print ret # => [3, 8]
  #
  # multi args case
  #
  #   lists = [[*1..5], [*6..10]]
  #   ret = lists.together_slice 2, 2
  #   print ret # => [[3, 4], [8, 9]]
  #
  # range args case
  #
  #   lists = [[*1..5], [*6..10]]
  #   ret = lists.together_slice (2..3)
  #   print ret # => [[3, 4], [8, 9]]
  #
  def together_slice(*args)
    if_not_contain_array_rails_type_error
    reduce([]) { |ret, list|ret << list.slice(*args) }
  end

  alias_method :tslice, :together_slice
end

# encoding: utf-8
require 'open_classes/object'
require 'open_classes/module'
require 'open_classes/array/together_helper'

# Array
class Array
  include TogetherHelper

  # Arrays bulk shift.
  #
  # together_shift has alias :tshift
  #
  # not empty case
  #   lists = [[1, 2], [5, 6]]
  #   ret = lists.together_shift
  #   print ret # => [1, 5]
  #   print lists # => [2, 6]
  #
  # empty case
  #   lists = [[], []]
  #   ret = lists.together_shift
  #   print ret # => [nil, nil]
  #   print lists # => [[], []]
  #
  # not empty case with args
  #   lists = [[1, 2], [5, 6]]
  #   ret = lists.together_shift 2
  #   print ret # => [[1, 2], [5, 6]]
  #   print lists # => [[], []]
  #
  # not empty case with args
  #   lists = [[], []]
  #   ret = lists.together_shift 2
  #   print ret # => [[], []]
  #   print lists # => [[], []]
  def together_shift(count = nil)
    if_not_contain_array_rails_type_error
    if count.nil?
      reduce([]) { |ret, list|ret << list.shift }
    else
      reduce([]) { |ret, list|ret << list.shift(count) }
    end
  end

  alias_method :tshift, :together_shift
end

# encoding: utf-8
require 'open_classes/object'
require 'open_classes/module'
require 'open_classes/array/together_helper'

# Array
class Array
  include TogetherHelper

  # Arrays bulk sample.
  #
  # together_sample has alias :tsample
  #
  # not empty case
  #   lists = [[1, 2], [5, 6]]
  #   ret = lists.together_sample
  #   print ret # => [1 or 2, 5 or 6]
  #
  # empty case
  #   lists = [[], []]
  #   ret = lists.together_sample
  #   print ret # => [nil, nil]
  #
  # not empty case with args
  #   lists = [[1, 2], [5, 6]]
  #   ret = lists.together_sample 2
  #   print ret # => [[1 or 2, 1 or 2], [5 or 6, 5 or 6]]
  #
  # not empty case with args
  #   lists = [[], []]
  #   ret = lists.together_sample 2
  #   print ret # => [[], []]
  #
  # not empty, over size case with args
  #   lists = [[1, 2], [5, 6]]
  #   ret = lists.together_sample 3
  #   print ret # => [[1 or 2, 1 or 2], [5 or 6, 5 or 6]]
  #
  def together_sample(count = nil)
    if_not_contain_array_rails_type_error
    if count.nil?
      reduce([]) { |ret, list|ret << list.sample }
    else
      reduce([]) { |ret, list|ret << list.sample(count) }
    end
  end

  alias_method :tsample, :together_sample
end

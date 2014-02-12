# encoding: utf-8
require 'open_classes/object'
require 'open_classes/module'
require 'open_classes/array/together_helper'

# Array
class Array
  include TogetherHelper

  # Arrays bulk first.
  #
  # together_first has alias :tfirst
  #
  # no args case
  #   lists = [[*1..5], [*6..10]]
  #   ret = lists.together_first
  #   print ret # => [1, 6]
  #
  # has args 2 case
  #   lists = [[*1..5], [*6..10]]
  #   ret = lists.together_first 2
  #   print ret # => [[1, 2], [6, 7]]
  #
  # has args 0 case
  #   lists = [[*1..5], [*6..10]]
  #   ret = lists.together_first 0
  #   print ret # => [[], []]
  #
  # has args over size case
  #   lists = [[*1..5], [*6..10]]
  #   ret = lists.together_first 6
  #   print ret # => [[*1..5], [*6..10]]
  def together_first(index = nil)
    if_not_contain_array_rails_type_error
    each_return = index == 0 ? '[]' : index.nil? ? 'list.first' : 'list.first(index)'
    reduce([]) { |ret, list|ret << eval(each_return, binding) }
  end

  alias_method :tfirst, :together_first
end

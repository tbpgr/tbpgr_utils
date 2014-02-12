# encoding: utf-8
require 'open_classes/object'
require 'open_classes/module'
require 'open_classes/array/together_helper'

# Array
class Array
  include TogetherHelper

  # Arrays bulk last.
  #
  # together_last has alias :tlast
  #
  # no args case
  #   lists = [[*1..5], [*6..10]]
  #   ret = lists.together_last
  #   print ret # => [5, 10]
  #
  # has args 2 case
  #   lists = [[*1..5], [*6..10]]
  #   ret = lists.together_last 2
  #   print ret # => [[4, 5], [9, 10]]
  #
  # has args 0 case
  #   lists = [[*1..5], [*6..10]]
  #   ret = lists.together_last 0
  #   print ret # => [[], []]
  #
  # has args over size case
  #   lists = [[*1..5], [*6..10]]
  #   ret = lists.together_last 6
  #   print ret # => [[*1..5], [*6..10]]
  def together_last(index = nil)
    if_not_contain_array_rails_type_error
    each_return = index == 0 ? '[]' : index.nil? ? 'list.last' : 'list.last(index)'
    reduce([]) { |ret, list|ret << eval(each_return, binding) }
  end

  alias_method :tlast, :together_last
end

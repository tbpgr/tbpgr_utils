# encoding: utf-8
require 'open_classes/object'
require 'open_classes/module'
require 'open_classes/array/together_helper'

# Array
class Array
  include TogetherHelper

  # Arrays bulk delete_at.
  #
  # together_delete_at has alias :tdelete_at
  #
  # if delete_at target is exist
  #   child1 = [1, 2, 3, 4]
  #   child2 = [2, 3, 4, 5]
  #   lists = [child1, child2]
  #   ret = lists.together_delete_at 2
  #   print ret # => [3, 4]
  #   print lists # => output [[1, 2, 4], [2, 3, 5]]
  #
  # if delete_at target is not exist
  #   child1 = [1, 2, 3, 4]
  #   child2 = [2, 3, 4, 5]
  #   lists = [child1, child2]
  #   ret = lists.together_delete_at 6
  #   print ret # => [nil, nil]
  #   print lists # => output [[1, 2, 3, 4], [2, 3, 4, 5]]
  #
  # if delete_at target is exist(minus index)
  #   child1 = [1, 2, 3, 4]
  #   child2 = [2, 3, 4, 5]
  #   lists = [child1, child2]
  #   ret = lists.together_delete_at -3
  #   print ret # => [2, 3]
  #   print lists # => output [[1, 3, 4], [2, 4, 5]]
  def together_delete_at(index)
    if_not_contain_array_rails_type_error
    reduce([]) { |ret, list|ret << list.delete_at(index) }
  end

  alias_method :tdelete_at, :together_delete_at
end

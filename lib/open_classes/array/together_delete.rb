# encoding: utf-8
require 'open_classes/object'
require 'open_classes/module'
require 'open_classes/array/together_helper'

# Array
class Array
  include TogetherHelper

  # Arrays bulk delete.
  #
  # together_delete has alias :tdelete
  #
  # if delete target is exist
  #   child1 = [1, 2, 3, 4]
  #   child2 = [2, 3, 4, 5]
  #   lists = [child1, child2]
  #   ret = lists.together_delete 2
  #   print ret # => 2
  #   print lists # => output [[1, 3, 4], [3, 4, 5]]
  #
  # if delete target is not exist
  #   child1 = [1, 2, 3, 4]
  #   child2 = [2, 3, 4, 5]
  #   lists = [child1, child2]
  #   ret = lists.together_delete 6
  #   print ret # => nil
  #   print lists # => output [[1, 2, 3, 4], [2, 3, 4, 5]]
  #
  # if delete target is not exist and use block
  #   child1 = [1, 2, 3, 4]
  #   child2 = [2, 3, 4, 5]
  #   lists = [child1, child2]
  #   ret = lists.together_delete(6) { 999 }
  #   print ret # => 999
  #   print lists # => output [[1, 2, 3, 4], [2, 3, 4, 5]]
  def together_delete(value)
    if_not_contain_array_rails_type_error
    ret = []
    each { |list|ret << list.delete(value) }
    default_return = block_given? ? yield : nil
    ret.compact.size == 0 ? default_return : value
  end

  alias_method :tdelete, :together_delete
end

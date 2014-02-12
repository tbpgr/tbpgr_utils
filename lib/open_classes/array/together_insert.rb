# encoding: utf-8
require 'open_classes/object'
require 'open_classes/module'
require 'open_classes/array/together_helper'

# Array
class Array
  include TogetherHelper

  # Arrays bulk insert.
  #
  # together_insert has alias :tinsert
  #
  # both insert exist case
  #   lists = [[*1..5], [*5..9]]
  #   ret = lists.together_insert(1, 55, 66)
  #   print ret # => [[1, 55, 66, 2, 3, 4, 5], [5, 55, 66, 6, 7, 8, 9]]
  #
  # both insert exist and minus index case
  #   lists = [[*1..5], [*5..9]]
  #   ret = lists.together_insert(-2, 55, 66)
  #   print ret # => [[1, 2, 3, 4, 55, 66, 5], [5, 6, 7, 8, 55, 66, 9]]
  #
  # both insert exist case
  #   lists = [[*1..5], [*5..9]]
  #   ret = lists.together_insert(6, 55, 66)
  #   print ret # => [[1, 2, 3, 4, 5, nil, 55, 66], [5, 6, 7, 8, 9, nil, 55, 66]],
  def together_insert(index, *args)
    if_not_contain_array_rails_type_error
    each { |list|list.insert(index, *args) }
  end

  alias_method :tinsert, :together_insert
end

# encoding: utf-8
require 'open_classes/object'
require 'open_classes/module'
require 'open_classes/array/together_helper'

# Array
class Array
  include TogetherHelper

  # Arrays bulk compact.(immutable)
  #
  # together_compact has alias :tcompact
  #
  # same elements size case
  #   alpha = ['a','b','c', nil,'d']
  #   numbers = [1, 2, nil, 3]
  #   lists = [alpha, numbers]
  #   ret = lists.together_compact
  #   print lists # => output [['a','b','c', nil,'d'], [1, 2, nil, 3]]
  #   print ret # => output [['a','b','c','d'], [1, 2, 3]]
  def together_compact
    if_not_contain_array_rails_type_error
    reduce([]) { |ret, list|ret << list.compact }
  end

  # Arrays bulk compact!.(mutable)
  #
  # together_compact! has alias :tcompact!
  #
  # same elements size case
  #   alpha = ['a','b','c', nil,'d']
  #   numbers = [1, 2, nil, 3]
  #   lists = [alpha, numbers]
  #   ret = lists.together_compact!
  #   print lists # => output [['a','b','c','d'], [1, 2, 3]]
  #   print ret # => output [['a','b','c','d'], [1, 2, 3]]
  def together_compact!
    if_not_contain_array_rails_type_error
    each { |list|list.compact! }
  end

  alias_method :tcompact, :together_compact
  alias_method :tcompact!, :together_compact!
end

# encoding: utf-8
require 'open_classes/object'
require 'open_classes/module'
require 'open_classes/array/together_helper'

# Array
class Array
  include TogetherHelper

  # Arrays bulk reverse.
  #
  # together_reverse has alias :treverse
  #
  # not empty case
  #   lists = [[1, 2], [5, 6]]
  #   ret = lists.together_reverse
  #   print ret # => [[2, 1], [6, 5]]
  #   print lists # => [[1, 2], [5, 6]]
  #
  # one empty case
  #   lists = [[1, 2], []]
  #   ret = lists.together_reverse
  #   print ret # => [[2, 1], []]
  #   print lists # => [[1, 2], []]
  def together_reverse
    if_not_contain_array_rails_type_error
    reduce([]) { |ret, list|ret << list.reverse }
  end


  # Arrays bulk reverse!.
  #
  # together_reverse! has alias :treverse!
  #
  # not empty case
  #   lists = [[1, 2], [5, 6]]
  #   ret = lists.together_reverse!
  #   print ret # => [[2, 1], [6, 5]]
  #   print lists # => [[2, 1], [6, 5]]
  #
  # one empty case
  #   lists = [[1, 2], []]
  #   ret = lists.together_reverse!
  #   print ret # => [[2, 1], []]
  #   print lists # => [[2, 1], []]
  def together_reverse!
    if_not_contain_array_rails_type_error
    reduce([]) { |ret, list|ret << list.reverse! }
  end

  alias_method :treverse, :together_reverse
  alias_method :treverse!, :together_reverse!
end

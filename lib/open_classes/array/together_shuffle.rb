# encoding: utf-8
require 'open_classes/object'
require 'open_classes/module'
require 'open_classes/array/together_helper'

# Array
class Array
  include TogetherHelper

  # Arrays bulk shuffle.
  #
  # together_shuffle has alias :tshuffle
  #
  #   lists = [[1, 2], [5, 6]]
  #   ret = lists.together_shuffle
  #   print ret # => [[1 or 2, 1 or 2], [5 or 6, 5 or 6]]
  def together_shuffle(count = nil)
    if_not_contain_array_rails_type_error
    reduce([]) { |ret, list|ret << list.shuffle }
  end

  alias_method :tshuffle, :together_shuffle
end

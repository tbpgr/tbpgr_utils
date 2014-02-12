# encoding: utf-8
require 'open_classes/object'
require 'open_classes/module'
require 'open_classes/array/together_helper'

# Array
class Array
  include TogetherHelper

  # Arrays bulk fill.
  #
  # together_fill has alias :tfill
  #
  # not use block case
  #   lists = [[*1..5], [*6..10]]
  #   ret = lists.together_fill(99)
  #   print ret # => [[99, 99, 99, 99, 99], [99, 99, 99, 99, 99]]
  #
  # use block, no args case
  #   lists = [[*1..5], [*6..10]]
  #   ret = lists.together_fill { |i|(i + 1) + 1 }
  #   print ret # => [[2, 3, 4, 5, 6], [2, 3, 4, 5, 6]]
  #
  # use block, has args case
  #   lists = [[*1..5], [*6..10]]
  #   ret = lists.together_fill(2) { |i|(i + 1) + 1 }
  #   print ret # => [[1, 2, 4, 5, 6], [6, 7, 4, 5, 6]]
  def together_fill(fill_value = nil, &block)
    if_not_contain_array_rails_type_error
    if block
      fill_value = 0 if fill_value.nil?
      first.each_with_index do |i_v, i|
        next if i < fill_value
        each { |list|list[i] = yield(i) }
      end
    else
      each { |list|list.fill fill_value }
    end
    self
  end

  alias_method :tfill, :together_fill
end

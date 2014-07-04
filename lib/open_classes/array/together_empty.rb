# encoding: utf-8
require 'open_classes/object'
require 'open_classes/module'
require 'open_classes/array/together_helper'

# Array
class Array
  include TogetherHelper

  # Arrays bulk empty?.
  #
  # together_empty? has alias :tempty?
  #
  # empty case
  #   lists = [[], []]
  #   ret = lists.together_empty?
  #   print ret # => true
  #
  # not empty case
  #   lists = [[1], []]
  #   ret = lists.together_empty?
  #   print ret # => false
  def together_empty?
    if_not_contain_array_rails_type_error
    is_empty = true
    each { |list|is_empty &&= list.empty? }
    is_empty
  end

  alias_method :tempty?, :together_empty?
end

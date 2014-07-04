# encoding: utf-8
require 'open_classes/object'
require 'open_classes/module'
require 'open_classes/array/together_helper'

# Array
class Array
  include TogetherHelper

  # Arrays bulk include?.
  #
  # together_include? has alias :tinclude?
  #
  # both include single ret case
  #   lists = [[*1..5], [*5..9]]
  #   ret = lists.together_include? 5
  #   print ret # => true
  #
  # one include single ret case
  #   lists = [[*1..5], [*5..9]]
  #   ret = lists.together_include? 9
  #   print ret # => true
  #
  # both not include single ret case
  #   lists = [[*1..5], [*5..9]]
  #   ret = lists.together_include? 10
  #   print ret # => false
  #
  # both include multi ret case
  #   lists = [[*1..5], [*5..9]]
  #   ret = lists.together_include? 5, true
  #   print ret # => [true, true]
  #
  # one include multi ret case
  #   lists = [[*1..5], [*5..9]]
  #   ret = lists.together_include? 9, true
  #   print ret # => [false, true]
  #
  # both not include multi ret case
  #   lists = [[*1..5], [*5..9]]
  #   ret = lists.together_include? 10, true
  #   print ret # => [false, false]
  def together_include?(value, is_multi = false)
    if_not_contain_array_rails_type_error
    return reduce([]) { |ret, list|ret << list.include?(value) } if is_multi
    reduce(false) { |ret, list|ret ||= list.include?(value) }
  end

  alias_method :tinclude?, :together_include?
end

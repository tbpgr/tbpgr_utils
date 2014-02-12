# encoding: utf-8
require 'open_classes/object'
require 'open_classes/module'
require 'open_classes/array/together_helper'

# Array
class Array
  include TogetherHelper

  # Arrays bulk delete_if.
  #
  # together_delete_if has alias :tdelete_if
  #
  # if delete_if target is exist. return self.
  #   lists = [[1, 2, 3, 4], [6, 4, 6, 8]]
  #   ret = lists.together_delete_if {|first, second|(first + second).odd?}
  #   print ret # => [[2, 4], [4, 8]]
  #
  # if delete_if target is not exist. return nil.
  #   lists = [[2, 2, 4, 4], [6, 4, 6, 8]]
  #   ret = lists.together_delete_if {|first, second|(first + second).odd?}
  #   print ret # => nil
  def together_delete_if(&block)
    if_not_contain_array_rails_type_error
    have_deleted = false
    first.each_with_index do |i_v, i|
      eval_each_str = get_args_str_for_together i
      is_delete = instance_eval "yield(#{eval_each_str})"
      if is_delete
        each { |e|e.delete_at i }
        have_deleted = true
      end
    end
    have_deleted ? self : nil
  end

  alias_method :tdelete_if, :together_delete_if
end

# encoding: utf-8
require 'open_classes/object'
require 'open_classes/module'

# TogetherHelper
module TogetherHelper
  def if_not_contain_array_rails_type_error
    each { |f|fail TypeError, "you have to use [Array1, Array2, ...] | #{f.class} is invalid" unless f.class == Array }
  end

  def get_args_for_together(i)
    eval_each = []
    each_with_index { |j_v, j|eval_each << "self[#{j}][#{i}]" }
    eval_each
  end

  def get_args_str_for_together(i, with_index = false)
    each_eval = with_index ? get_args_for_together(i) << i : get_args_for_together(i)
    each_eval.join(',')
  end

  def together_return_multi?(list)
    (list.class == Array && list.size == size).to_bool
  end
end

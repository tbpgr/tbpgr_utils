# encoding: utf-8
require 'open_classes/object'
require 'open_classes/module'
require 'open_classes/array/together_helper'

# Array
class Array
  include TogetherHelper

  # Arrays loop together with index.
  #
  #   alpha = %w{one two three}
  #   numbers = %w{1 2 3}
  #   [alpha, numbers].together_with_index do |first, second, index|
  #     print "#{index.to_s}:#{first}:#{second}\n"  # => output 0:one:1, 1:two:2, 2:three:3
  #   end
  def together_with_index
    if_not_contain_array_rails_type_error
    first.each_with_index do |i_v, i|
      eval_each_str = get_args_str_for_together i, true
      instance_eval "yield(#{eval_each_str})"
    end
  end
end

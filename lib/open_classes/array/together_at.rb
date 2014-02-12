# encoding: utf-8
require 'open_classes/object'
require 'open_classes/module'
require 'open_classes/array/together_helper'

# Array
class Array
  include TogetherHelper

  # Arrays bulk at.
  #
  # together_at has alias :tat
  #
  # same elements size case
  #   alpha = %w{one two three}
  #   numbers = %w{1 2 3}
  #   [alpha, numbers].together_at 2 # => output ['three', 3]
  #
  # different elements size case
  #   alpha = %w{one two three}
  #   numbers = %w{1 2}
  #   [alpha, numbers].together_at 2 # => output ['three', nil]
  def together_at(index)
    if_not_contain_array_rails_type_error
    reduce([]) { |ats, list|ats << list.at(index) }
  end

  alias_method :tat, :together_at
end

# encoding: utf-8
require 'open_classes/object'
require 'open_classes/module'
require 'open_classes/array/together_helper'

# Array
class Array
  include TogetherHelper

  # Arrays bulk clear.
  #
  # together_clear has alias :tclear
  #
  # same elements size case
  #   alpha = %w{one two three}
  #   numbers = %w{1 2 3}
  #   [alpha, numbers].together_clear # => output [[],[]]
  def together_clear
    if_not_contain_array_rails_type_error
    each { |list|list.clear }
  end

  alias_method :tclear, :together_clear
end

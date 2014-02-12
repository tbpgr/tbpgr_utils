# encoding: utf-8
require 'open_classes/object'
require 'open_classes/module'
require 'open_classes/array/together_helper'

# Array
class Array
  include TogetherHelper

  # Arrays bulk concat.
  #
  # together_concat has alias :tconcat
  #
  #   alpha = %w{one two three}
  #   numbers = %w{1 2 3}
  #   [alpha, numbers].together do |first, second|
  #     print "#{first}:#{second}\n"  # => output one:1, two:2, three:3
  #   end
  def together_concat(other)
    if_not_contain_array_rails_type_error
    each { |list|list.concat other }
  end

  alias_method :tconcat, :together_concat
end

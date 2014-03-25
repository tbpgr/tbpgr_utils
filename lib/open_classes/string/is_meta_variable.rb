# encoding: utf-8
require'metasyntactic_variable'

# String
class String
  # is meta variable.
  #
  # ==== Examples
  #
  #   'foo'.is_meta_variable? # => true
  #   'bar'.is_meta_variable? # => true
  #   'baz'.is_meta_variable? # => true
  #   ''.is_meta_variable? # => false
  #   'aaa'.is_meta_variable? # => false
  #
  def is_meta_variable?
    MetasyntacticVariable.meta_variables.include? to_sym
  end
end

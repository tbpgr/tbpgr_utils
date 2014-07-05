# encoding: utf-8
require 'metasyntactic_variable'

# String
class String
  # is meta variable.
  #
  # ==== Examples
  #
  #   'foo'.meta_variable? # => true
  #   'bar'.meta_variable? # => true
  #   'baz'.meta_variable? # => true
  #   ''.meta_variable? # => false
  #   'aaa'.meta_variable? # => false
  #
  def meta_variable?
    MetasyntacticVariable.meta_variables.include? to_sym
  end
end

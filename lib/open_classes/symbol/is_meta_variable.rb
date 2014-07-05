# encoding: utf-8
require 'metasyntactic_variable'

# Symbol
class Symbol
  # is meta variable.
  #
  # ==== Examples
  #
  #   :foo.meta_variable? # => true
  #   :bar.meta_variable? # => true
  #   :baz.meta_variable? # => true
  #   :aaa.meta_variable? # => false
  #
  def meta_variable?
    MetasyntacticVariable.meta_variables.include? self
  end
end

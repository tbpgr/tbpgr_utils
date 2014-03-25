# encoding: utf-8
require'metasyntactic_variable'

# Symbol
class Symbol
  # is meta variable.
  #
  # ==== Examples
  #
  #   :foo.is_meta_variable? # => true
  #   :bar.is_meta_variable? # => true
  #   :baz.is_meta_variable? # => true
  #   :aaa.is_meta_variable? # => false
  #
  def is_meta_variable?
    MetasyntacticVariable.meta_variables.include? self
  end
end

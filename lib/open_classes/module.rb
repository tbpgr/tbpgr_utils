# encoding: utf-8

# Module
class Module
  # create alias methods.
  #
  # create hoge's aliases [:hige, :huge] case
  #   alias_methods [:hige, :fuge], :hoge
  def alias_methods(new_methods, old_method)
    fail TypeError, "invalid type #{new_methods.class}" unless new_methods.class == Array
    new_methods.each { |new_method|alias_method new_method, old_method }
  end
end

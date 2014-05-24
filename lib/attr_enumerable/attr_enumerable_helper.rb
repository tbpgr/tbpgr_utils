# encoding: utf-8
require 'active_support/inflector'

# AttrEnumerable
module AttrEnumerable
  ATTR_METHODS = [
    { regexp: /^each_(.*)_with_index$/, call_method: :each_attr_with_index },
    { regexp: /^each_(.*)$/, call_method: :each_attr }
                 ]

  # call attr enumerable method.
  def method_missing(method_name, *args, &block)
    attr_method = detect(method_name)
    send(attr_method[:call_method], attr_method[:attribute], &block)
 rescue
   super(method_name, *args, &block)
  end

  private
  def detect(method_name)
    ATTR_METHODS.each do |attr_method|
      regexp = attr_method[:regexp]
      if method_name.to_s =~ regexp
        attribute = method_name.to_s.scan(regexp).first.first
        return { call_method: attr_method[:call_method], attribute: attribute }
      end
    end
    fail NoMethodError, "method is not exists #{method_name}"
  end

  def include_attr?(element, attribute)
    element.instance_variables.include? :"@#{attribute}"
  end

  def collection
    instance_variable_get("@#{self.class.name.underscore}")
  end
end

# encoding: utf-8
require 'active_support/inflector'

# AttrEnumerable
module AttrEnumerable
  ATTR_METHODS = [
    { regexp: /^each_(.*)_with_index$/, call_method: :each_attr_with_index },
    { regexp: /^each_(.*)$/, call_method: :each_attr },
    { regexp: /^reverse_(.*)$/, call_method: :reverse_attr },
    { regexp: /^at_(.*)$/, call_method: :at_attr },
    { regexp: /^compact_(.*)$/, call_method: :compact_attr },
    { regexp: /^concat_(.*)$/, call_method: :concat_attr },
    { regexp: /^delete_(.*)$/, call_method: :delete_attr },
    { regexp: /^first_(.*)$/, call_method: :first_attr },
    { regexp: /^include_(.*)\?$/, call_method: :include_attribute? },
    { regexp: /^last_(.*)$/, call_method: :last_attr },
    { regexp: /^map_(.*)$/, call_method: :map_attr }
  ]

  # call attr enumerable method.
  def method_missing(method_name, *args, &block)
    target_method = detect(method_name)
    send(target_method[:call_method], target_method[:attribute], method_name, *args, &block)
  rescue
   raise
  end

  private
  def detect(method_name)
    ATTR_METHODS.each do |target_method|
      regexp = target_method[:regexp]
      if method_name.to_s =~ regexp
        attribute = method_name.to_s.scan(regexp).first.first
        return { call_method: target_method[:call_method], attribute: attribute }
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

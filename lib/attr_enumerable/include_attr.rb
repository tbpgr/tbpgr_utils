# encoding: utf-8
require 'attr_enumerable/attr_enumerable_helper'

# AttrEnumerable
module AttrEnumerable
  private
    def include_attribute?(attribute, method_name, *args, &block)
      col = collection
      return false if col.empty?
      include_value = args.first
      fail ArgumentError, "invalid attribute #{attribute}" unless include_attr?(col.first, attribute)
      attrs = col.map { |v|v.send(attribute) }
      attrs.include?(include_value)
    end
end

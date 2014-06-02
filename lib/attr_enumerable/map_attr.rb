# encoding: utf-8
require 'attr_enumerable/attr_enumerable_helper'

# AttrEnumerable
module AttrEnumerable
  private
    def map_attr(attribute, method_name, *args, &block)
      col = collection
      return [] if col.empty?
      first_size = args.size == 0 ? nil : Integer(args.first)
      fail ArgumentError, "invalid attribute #{attribute}" unless include_attr?(col.first, attribute)
      attrs = col.map { |v|v.send(attribute) }
      attrs.reduce([]) { |r, v|r << yield(v); r }
    end
end

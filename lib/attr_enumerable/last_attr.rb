# encoding: utf-8
require 'attr_enumerable/attr_enumerable_helper'

# AttrEnumerable
module AttrEnumerable
  private
    def last_attr(attribute, method_name, *args, &block)
      col = collection
      return [] if col.empty?
      last_size = args.size == 0 ? nil : Integer(args.last)
      fail ArgumentError, "invalid attribute #{attribute}" unless include_attr?(col.last, attribute)
      attrs = col.map { |v|v.send(attribute) }
      last_size.nil? ? attrs.last : attrs.last(last_size)
    end
end

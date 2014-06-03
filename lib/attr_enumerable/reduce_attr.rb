# encoding: utf-8
require 'attr_enumerable/attr_enumerable_helper'

# AttrEnumerable
module AttrEnumerable
  private
    def reduce_attr(attribute, method_name, *args, &block)
      col = collection
      init_value = args.size == 0 ? 0 : args.first
      return init_value if col.empty?
      fail ArgumentError, "invalid attribute #{attribute}" unless include_attr?(col.first, attribute)
      attrs = col.map { |e|e.send(attribute) }
      attrs.reduce(init_value) { |a, e|a = yield(a, e); a }
    end
end

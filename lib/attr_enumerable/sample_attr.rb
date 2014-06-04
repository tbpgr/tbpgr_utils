# encoding: utf-8
require 'attr_enumerable/attr_enumerable_helper'

# AttrEnumerable
module AttrEnumerable
  private
    def sample_attr(attribute, method_name, *args, &block)
      col = collection
      count = args.size == 0 ? 1 : Integer(args.first)
      fail ArgumentError, "invalid attribute #{attribute}" unless include_attr?(col.first, attribute)
      attrs = col.map { |e|e.send(attribute) }
      attrs.sample(count)
    end
end

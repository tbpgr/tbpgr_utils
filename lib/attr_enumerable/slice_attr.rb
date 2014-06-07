# encoding: utf-8
require 'attr_enumerable/attr_enumerable_helper'

# AttrEnumerable
module AttrEnumerable
  private
    def slice_attr(attribute, method_name, *args, &block)
      check_argument_length(*args)
      col = collection
      index_or_range = args.first
      length = args.size > 1 ? args[1] : nil
      fail ArgumentError, "invalid attribute #{attribute}" unless include_attr?(col.first, attribute)
      attrs = col.map { |e|e.send(attribute) }
      length ? attrs.slice(index_or_range, length) : attrs.slice(index_or_range)
    end

    def check_argument_length(*args)
      return if args.size > 0
      fail ArgumentError, 'wrong number of arguments (0 for 1..2) (ArgumentError)'
    end
end

# encoding: utf-8
require 'attr_enumerable/attr_enumerable_helper'

# AttrEnumerable
module AttrEnumerable
  private
    def compact_attr(attribute, method_name, *args, &block)
      return [] if collection.empty?
      super(method_name, *args) unless include_attr?(collection.first, attribute)
      collection.map(&attribute.to_sym).compact
    end
end

# encoding: utf-8
require 'active_support/inflector'
require 'attr_enumerable/attr_enumerable_helper'

# AttrEnumerable
module AttrEnumerable
  private
    def reverse_attr(attribute, *args, &block)
      collection.reduce([]) do |r, e|
        super(method_name, *args) unless include_attr?(e, attribute)
        r << e.send(attribute)
        r
      end.reverse
    end
end

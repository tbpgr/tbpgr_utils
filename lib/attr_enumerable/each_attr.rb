# encoding: utf-8
require 'active_support/inflector'
require 'attr_enumerable/attr_enumerable_helper'

# AttrEnumerable
module AttrEnumerable
  private
    def each_attr(attribute, method_name, *args, &block)
      collection.each do |element|
        super(method_name, *args) unless include_attr?(element, attribute)
        yield element.send(attribute)
      end
    end
end

# encoding: utf-8
require 'active_support/inflector'
require 'attr_enumerable/attr_enumerable_helper'

# AttrEnumerable
module AttrEnumerable
  private
    def each_attr_with_index(attribute, &block)
      collection.each_with_index do |element, index|
        super(method_name, *args) unless include_attr?(element, attribute)
        yield element.send(attribute), index
      end
    end
end

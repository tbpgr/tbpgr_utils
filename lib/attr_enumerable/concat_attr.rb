# encoding: utf-8
require 'attr_enumerable/attr_enumerable_helper'

# AttrEnumerable
module AttrEnumerable
  private
    def concat_attr(attribute, method_name, *args, &block)
      add_array = Array(*args)
      return add_array if collection.empty?
      super(method_name, *args) unless include_attr?(collection.first, attribute)
      collection.map(&attribute.to_sym).concat(add_array)
    end
end

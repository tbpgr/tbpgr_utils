# encoding: utf-8
require 'attr_enumerable/attr_enumerable_helper'

# AttrEnumerable
module AttrEnumerable
  private
    def at_attr(attribute, method_name, *args, &block)
      return nil if collection.empty?
      index = Integer(args.first)
      super(method_name, *args) unless include_attr?(collection.first, attribute)
      element = collection.at(index)
      return nil if element.nil?
      element.send(attribute)
    end
end

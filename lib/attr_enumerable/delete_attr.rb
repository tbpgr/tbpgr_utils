# encoding: utf-8
require 'attr_enumerable/attr_enumerable_helper'

# AttrEnumerable
module AttrEnumerable
  private
    def delete_attr(attribute, method_name, *args, &block)
      del_target = args.first
      return [] if collection.empty?
      super(method_name, *args) unless include_attr?(collection.first, attribute)
      del_targets = collection.select { |v|v.send(attribute) == del_target }
      del_targets.each { |each_target|collection.delete(each_target) }
      del_targets
    end
end

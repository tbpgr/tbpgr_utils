# encoding: utf-8
require 'familyable/familynize'
require 'attributes_initializable'

module Familyable
  class Person
    include AttributesInitializable
    attr_accessor_init :id, :parent_ids

    def <=>(other)
      id <=> other.id
    end
  end
end

# encoding: utf-8
require 'familyable/familynize'
require 'attributes_initializable'

module Familyable
  class Family
    include AttributesInitializable
    attr_accessor_init :family
    include Familynize
  end
end

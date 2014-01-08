# encoding: utf-8
require 'active_support'

# attr_accessor + initialize
module AttributesInitializable
  extend ActiveSupport::Concern

  module ClassMethods
    # generate attr_accessor + initialize
    # params
    # - symbols : attribute names
    def attr_accessor_init(*symbols)
      generate_accessors(symbols)
      generate_initializer(symbols)
    end

    private

    def generate_accessors(symbols)
      accessors = symbols.reduce([]) do |accessors, sym|
        fail TypeError, "invalid type #{sym.class}. you have to use Symbol" unless sym.class == Symbol
        accessors << ":#{sym.to_s}"
      end
      class_eval "attr_accessor #{accessors.join(',')}"
    end

    def generate_initializer(symbols)
      instance_eval do
        define_method :initialize do |values = nil, &block|
          return block.call self if block
          symbols.each {|symbol|self.method("#{symbol.to_s}=").call values[symbol]}
        end
      end
    end
  end
end

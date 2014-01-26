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
      generate_attr_accessor(symbols)
      generate_initializer(symbols)
    end

    # generate attr_reader + initialize
    # params
    # - symbols : attribute names
    def attr_reader_init(*symbols)
      generate_attr_reader(symbols)
      generate_initializer(symbols)
    end

    # generate attr_writer + initialize
    # params
    # - symbols : attribute names
    def attr_writer_init(*symbols)
      generate_attr_writer(symbols)
      generate_initializer(symbols)
    end

    private

    def generate_attr_accessor(symbols)
      generate_attr symbols, :accessor
    end

    def generate_attr_reader(symbols)
      generate_attr symbols, :reader
    end

    def generate_attr_writer(symbols)
      generate_attr symbols, :writer
    end

    def generate_attr(symbols, type)
      results = symbols.reduce([]) do |results, sym|
        fail TypeError, "invalid type #{sym.class}. you have to use Symbol" unless sym.class == Symbol
        results << ":#{sym.to_s}"
      end
      class_eval "attr_#{type.to_s} #{results.join(',')}"
    end

    def generate_initializer(symbols)
      instance_eval do
        define_method :initialize do |values = nil, &block|
          return block.call self if block
          symbols.each { |symbol|instance_variable_set("@#{symbol.to_s}", values[symbol]) }
        end
      end
    end
  end
end

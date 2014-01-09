# encoding: utf-8
require "erb"
require "active_support"

module Templatable
  extend ActiveSupport::Concern

  module ClassMethods
    def template(template)
      define_method :get_template do
        template
      end

      define_method :get_placeholders do
        ret = template.scan /<%=placeholders\[:(.*)\]%>/
        ret_hash = {}
        ret.each {|v| ret_hash[v.first.to_sym] = v.first}
        ret_hash
      end
    end
  end

  def initialize(materials)
    @materials = materials
  end

  def result
    placeholders = get_placeholders
    placeholders.each do |key, value|
      placeholders[key] = method("manufactured_#{value}").call
    end
    ERB.new(get_template).result(binding)
  end
end

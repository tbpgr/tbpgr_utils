# encoding: utf-8
require 'active_support/concern'

module Ghostable
  extend ActiveSupport::Concern

  module ClassMethods
    def ghost_method(pattern, basename, &ghost_block)
      define_method basename do |method_name, *args, &block|
        self.class.class_eval { ghost_block.call(method_name, *args, &block) }
      end

      @patterns ||= {}
      @patterns[basename] = pattern
      tmp_patterns = @patterns.dup
      define_method :get_patterns do
        tmp_patterns
      end
    end
  end

  def method_missing(method_name, *args, &block)
    get_patterns.each do |basename, pattern|
      return method(basename).call(method_name, *args, &block) if method_name.to_s.match(/#{pattern}/)
    end
    super
  end
end

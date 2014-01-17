# encoding: utf-8
require 'active_support/concern'
require 'tbpgr_utils'

module TemplateMethodable
  extend ActiveSupport::Concern

  module ClassMethods
    # template method force class macro
    #
    # concrete class must define *methods.
    # if not define '*method', raise NotImplementedError.
    #
    # sample BaseClass
    #   require "template_methodable"
    #   class BaseDeveloper
    #     include TemplateMethodable
    #     must_impl :easy_coding, :difficult_coding, :normal_coding
    #     module DIFFICILTY
    #       EASY = 1
    #       NORMAL = 2
    #       DIFFICILT = 3
    #     end
    #     def coding(difficulty)
    #       ret = []
    #       ret << "start coding"
    #       case difficulty
    #       when DIFFICILTY::EASY
    #         ret << easy_coding("hoge", "hige")
    #       when DIFFICILTY::NORMAL
    #         ret << normal_coding("hoge", "hige")
    #       when DIFFICILTY::DIFFICILT
    #         ret << difficult_coding("hoge", "hige")
    #       else
    #         fail 'error'
    #       end
    #       ret << "finish coding"
    #       ret.join("\n")
    #     end
    #   end
    #
    # sample Concrete Class. if you don't define xxxx_coding method, it raises NotImplementedError.
    #   class StarDeveloper < BaseDeveloper
    #     def easy_coding(hoge, hige)
    #       "complete 1 minutes"
    #     end
    #     def normal_coding(hoge, hige)
    #       "complete 10 minutes"
    #     end
    #     def difficult_coding(hoge, hige)
    #       "complete 59 minutes"
    #     end
    #   end
    def must_impl(*methods)
      return if methods.nil?
      fail TypeError, "invalid args type #{methods.class}. you must use Array or Symbol" unless methods.class.any_of? Array, Symbol
      methods = (methods.class.is_a? Symbol) ? [methods] : methods
      methods.each do |method_name|
        fail TypeError, "invalid args type #{method_name.class}. you must use Symbol" unless method_name.is_a? Symbol
        define_method method_name do |*args|
          raise NotImplementedError.new
        end
      end
    end
  end
end

# encoding: utf-8
require 'open_classes/kernel/bulk_define_methods'

module Kernel
  # define TrueClass method
  [:ok, :yes, :good].each do |m|
    define_method m do
      true
    end
  end

  # define FalseClass method
  [:ng, :no, :bad].each do |m|
    define_method m do
      false
    end
  end
end

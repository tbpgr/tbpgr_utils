# encoding: utf-8
require 'active_support/inflector'

# AttrEnumerable
module AttrEnumerable
  TARGET_METHOD_FILES = Dir.glob("#{File.dirname(__FILE__)}/*_attr*.rb").map { |file|File.basename(file, '.rb') }
  TARGET_METHODS = TARGET_METHOD_FILES.map do |v|
    regexp = v.gsub('attr', '(.*)')
    { regexp: /^#{regexp}$/, call_method: v.to_sym }
  end.reverse

  # call attr enumerable method.
  def method_missing(method_name, *args, &block)
    target_method = detect(method_name)
    send(target_method[:call_method], target_method[:attribute], method_name, *args, &block)
  rescue
   super(method_name, *args, &block)
  end

  private
  def detect(method_name)
    TARGET_METHODS.each do |target_method|
      regexp = target_method[:regexp]
      if method_name.to_s =~ regexp
        attribute = method_name.to_s.scan(regexp).first.first
        return { call_method: target_method[:call_method], attribute: attribute }
      end
    end
    fail NoMethodError, "method is not exists #{method_name}"
  end

  def include_attr?(element, attribute)
    element.instance_variables.include? :"@#{attribute}"
  end

  def collection
    instance_variable_get("@#{self.class.name.underscore}")
  end
end

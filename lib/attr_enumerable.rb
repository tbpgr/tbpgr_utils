# encoding: utf-8
require 'active_support/inflector'

# AttrEnumerable
module AttrEnumerable
  # define each_xxx.
  #
  # xxx is attribute name.
  # Class XxxxYyyys must have attributes xxxx_yyyys.
  # xxxx_yyyys is collection of Class XxxxYyyy.
  # XxxxYyyy has attributes.
  def method_missing(method_name, *args, &block)
    if method_name =~ /each_/
      attribute = method_name.to_s.scan(/each_(.*)/).first.first
      each_attr(attribute, &block)
    else
      super(method_name, *args, &block)
    end
  end

  private
    def each_attr(attribute, &block)
      collection = self.instance_variable_get("@#{self.class.name.underscore}")
      collection.each do |element|
        super(method_name, *args) unless element.instance_variables.include? :"@#{attribute}"
        yield element.send(attribute)
      end
    end
end

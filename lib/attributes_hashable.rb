# encoding: utf-8

# implement to_hash(instance_variable_name => key, instance_variable_value => value)
module AttributesHashable
  # create hash(instance_variable_name => key, instance_variable_value => value)
  #
  # class Hoge have two_attributes(:hoge, :hige)
  #   class Hoge
  #     include AttributesInitializable
  #     attr_accessor_init :hoge, :hige
  #     include AttributesHashable
  #   end
  #
  #   hoge = Hoge.new do |h|
  #     h.hoge = 'hoge'
  #     h.hige = 'hige'
  #   end
  #
  #   hoge.to_hash # => {:hoge=>"hoge", :hige=>"hige"}
  #
  # After include AttributesHashable, you can use Hash.try_convert.
  #   Hash.try_convert hoge # => {:hoge=>"hoge", :hige=>"hige"}
  def to_hash
    instance_variables.reduce({}) do |hash, var|
      hash[var.to_s.delete('@').to_sym] = instance_variable_get(var)
      hash
    end
  end

  alias_method :to_h, :to_hash
end

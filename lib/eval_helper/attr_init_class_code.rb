# encoding: utf-8

module EvalHelper
  # create attr_accessor + initialize code, for eval
  #
  # ==== Examples
  #
  #   class EvalHelperAttrInitTest
  #     include EvalHelper
  #
  #     def hoge(hash)
  #       attr_init_class_code(hash[:class_name], hash[:fields])
  #     end
  #   end
  #
  #   hash = {
  #     class_name: "Hoge",
  #     fields: [:hoge1, :hoge2, :hoge3],
  #   }
  #   EvalHelperAttrInitTest.new.hoge(hash)
  #
  # result
  #
  #   require 'attributes_initializable'
  #
  #   class Hoge
  #     include AttributesInitializable
  #     attr_accessor_init :hoge1, :hoge2, :hoge3
  #   end
  #
  def attr_init_class_code(class_name, fields)
    tmp_fields = fields.map { |v|":#{v.to_s}" }.join(', ')
    <<-EOS
require 'attributes_initializable'

class #{class_name}
  include AttributesInitializable
  attr_accessor_init #{tmp_fields}
end
    EOS
  end
end

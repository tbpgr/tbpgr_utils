# encoding: utf-8

module EvalHelper
  # create attr_accessor + initialize code, for eval
  #
  # ==== Examples
  #
  # single case
  #
  #   class EvalHelperAttrAccessorInitTest
  #     include EvalHelper
  #
  #     def hoge(args)
  #       attr_accessor_init_code(args)
  #     end
  #   end
  #
  #   EvalHelperAttrAccessorInitTest.new.hoge('atr1')
  #
  # result
  #
  #   attr_accessor :atr1
  #
  #   def initialize(atr1)
  #     @atr1 = atr1
  #   end
  #
  # multi case
  #
  #   class EvalHelperAttrAccessorInitTest
  #     include EvalHelper
  #
  #     def hoge(args)
  #       attr_accessor_init_code(args)
  #     end
  #   end
  #
  #   EvalHelperAttrAccessorInitTest.new.hoge(['atr1', 'atr2'])
  #
  # result
  #
  #   attr_accessor :atr1, :atr2
  #
  #   def initialize(atr1, atr2)
  #     @atr1 = atr1
  #     @atr2 = atr2
  #   end
  #
  def attr_accessor_init_code(attribute)
    return '' unless [String, Array].include? attribute.class
    atrs = []
    if attribute.is_a? String
      atrs << attribute
    elsif attribute.is_a? Array
      atrs = attribute
    end

    accessors = atrs.reduce([]) { |a, e|a << ":#{e}" }.join(', ')
    init_variables = atrs.reduce([]) { |a, e|a << "#{e}" }.join(', ')
    set_variables = atrs.reduce([]) { |a, e|a << "  @#{e} = #{e}" }.join("\n")
    ret_code = <<-EOS
attr_accessor #{accessors}

def initialize(#{init_variables})
#{set_variables}
end
    EOS
  end
end

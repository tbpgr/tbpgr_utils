# encoding: utf-8

module EvalHelper
  # create require_relative strings, for eval
  #
  # ==== Examples
  #
  # single require_relative case
  #
  #   class EvalHelperRequireRelativeTest
  #     include EvalHelper
  #
  #     def hoge(*args)
  #       require_relative_code(args)
  #     end
  #   end
  #
  #   args = 'tbpgr_utils'
  #   EvalHelperRequireRelativeTest.new.hoge(args) # => return "require_relative 'tbpgr_utils'\n"
  #
  # muiti require_relative case
  #
  #   class EvalHelperRequireRelativeTest
  #     include EvalHelper
  #
  #     def hoge(*args)
  #       require_relative_code(args)
  #     end
  #   end
  #
  #   args =  ['tbpgr_utils', 'eval_helper']
  #   EvalHelperRequireRelativeTest.new.hoge(args) # => return "require_relative 'tbpgr_utils'\nrequire_relative 'eval_helper'\n"
  #
  def require_relative_code(*args)
    args = args.is_a?(Array) ? args.flatten : [args]
    args.reduce([]) { |ret, v|ret << "require_relative '#{v}'\n" }.join
  end
end

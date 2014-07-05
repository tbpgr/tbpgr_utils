# encoding: utf-8

module EvalHelper
  # create require strings, for eval
  #
  # ==== Examples
  #
  # single require case
  #
  #   class EvalHelperRequireTest
  #     include EvalHelper
  #
  #     def hoge(*args)
  #       require_code(args)
  #     end
  #   end
  #
  #   args = 'tbpgr_utils'
  #   EvalHelperRequireTest.new.hoge(args) # => return "require 'tbpgr_utils'\n"
  #
  # muiti require case
  #
  #   class EvalHelperRequireTest
  #     include EvalHelper
  #
  #     def hoge(*args)
  #       require_code(args)
  #     end
  #   end
  #
  #   args =  ['tbpgr_utils', 'eval_helper']
  #   EvalHelperRequireTest.new.hoge(args) # => return "require 'tbpgr_utils'\nrequire 'eval_helper'\n"
  #
  def require_code(*args)
    args = args.is_a?(Array) ? args.flatten : [args]
    args.reduce([]) { |a, e|a << "require '#{e}'\n" }.join
  end
end

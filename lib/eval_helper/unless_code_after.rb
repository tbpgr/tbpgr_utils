# encoding: utf-8

module EvalHelper
  # create unless strings, for eval
  #
  # ==== Examples
  #
  # unless case
  #
  #   class EvalHelperTest
  #     include EvalHelper
  #
  #     def hoge(hash)
  #       msg = hash[:input]
  #       code = unless_code_after(hash[:unless_cond], hash[:unless_proc])
  #       ret = 'dafault'
  #       instance_eval code
  #       ret
  #     end
  #   end
  #
  #   hash = {
  #     input: "not_test",
  #     unless_cond: "msg == 'test'",
  #     unless_proc: "ret = "true"",
  #   }
  #   EvalHelperTest.new.hoge(hash) # => return 'true'
  #
  # else case
  #
  #   class EvalHelperTest
  #     include EvalHelper
  #
  #     def hoge(hash)
  #       msg = hash[:input]
  #       code = unless_code_after(hash[:unless_cond], hash[:unless_proc])
  #       ret = 'ret = "true"'
  #       instance_eval code
  #       ret
  #     end
  #   end
  #
  #   hash = {
  #     input: "test",
  #     unless_cond: "msg == 'test'",
  #     unless_proc: "ret = "true"",
  #   }
  #   EvalHelperTest.new.hoge(hash) # => return 'default'
  #
  def unless_code_after(condition, unless_proc)
    "#{unless_proc} unless #{condition}"
  end
end

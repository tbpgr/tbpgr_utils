# encoding: utf-8

module EvalHelper
  # create if strings, for eval
  #
  # ==== Examples
  #
  # if case
  #
  #   class EvalHelperTest
  #     include EvalHelper
  #
  #     def hoge(hash)
  #       msg = hash[:input]
  #       code = if_code_after(hash[:if_cond], hash[:if_proc])
  #       ret = 'dafault'
  #       instance_eval code
  #       ret
  #     end
  #   end
  #
  #   hash = {
  #     input: "test",
  #     if_cond: "msg == 'test'",
  #     if_proc: "ret = "true"",
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
  #       code = if_code_after(hash[:if_cond], hash[:if_proc])
  #       ret = 'ret = "true"'
  #       instance_eval code
  #       ret
  #     end
  #   end
  #
  #   hash = {
  #     input: "not_test",
  #     if_cond: "msg == 'test'",
  #     if_proc: "ret = "true"",
  #   }
  #   EvalHelperTest.new.hoge(hash) # => return 'default'
  #
  def if_code_after(condition, if_proc)
    "#{if_proc} if #{condition}"
  end
end

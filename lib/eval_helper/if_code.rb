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
  #       code = if_code(hash[:if_cond], hash[:if_proc], hash[:else_proc])
  #       instance_eval code
  #     end
  #   end
  #
  #   hash = {
  #     input: "test",
  #     if_cond: "msg == 'test'",
  #     if_proc: "test",
  #     else_proc: "false",
  #   }
  #   EvalHelperTest.new.hoge(hash) # => return true
  #
  # else case
  #
  #   class EvalHelperTest
  #     include EvalHelper
  #
  #     def hoge(hash)
  #       msg = hash[:input]
  #       code = if_code(hash[:if_cond], hash[:if_proc], hash[:else_proc])
  #       instance_eval code
  #     end
  #   end
  #
  #   hash = {
  #     input: "not_test",
  #     if_cond: "msg == 'test'",
  #     if_proc: "test",
  #     else_proc: "false",
  #   }
  #   EvalHelperTest.new.hoge(hash) # => return false
  #
  def if_code(condition, if_proc, else_proc)
    <<-EOS
if #{condition}
  #{if_proc}
else
  #{else_proc}
end
    EOS
  end
end

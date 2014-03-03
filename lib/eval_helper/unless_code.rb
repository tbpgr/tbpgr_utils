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
  #       code = unless_code(hash[:unless_cond], hash[:unless_proc], hash[:else_proc])
  #       instance_eval code
  #     end
  #   end
  #
  #   hash = {
  #     input: "not_test",
  #     unless_cond: "msg == 'test'",
  #     unless_proc: "true",
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
  #       code = unless_code(hash[:unless_cond], hash[:unless_proc], hash[:else_proc])
  #       instance_eval code
  #     end
  #   end
  #
  #   hash = {
  #     input: "test",
  #     unless_cond: "msg == 'test'",
  #     unless_proc: "true",
  #     else_proc: "false",
  #   }
  #   EvalHelperTest.new.hoge(hash) # => return false
  #
  def unless_code(condition, unless_proc, else_proc)
    <<-EOS
unless #{condition}
  #{unless_proc}
else
  #{else_proc}
end
    EOS
  end
end

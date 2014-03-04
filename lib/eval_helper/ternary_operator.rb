# encoding: utf-8

module EvalHelper
  # create unless strings, for eval
  #
  # ==== Examples
  #
  # true case
  #
  #   class EvalHelperTernaryTest
  #     include EvalHelper
  #
  #     def hoge(hash)
  #       msg = hash[:input]
  #       code = \
  #         if hash[:ret]
  #           ternary_operator(hash[:cond], hash[:true_case], hash[:false_case], hash[:ret])
  #         else
  #           ternary_operator(hash[:cond], hash[:true_case], hash[:false_case])
  #         end
  #       instance_eval code
  #     end
  #   end
  #
  #   hash = {
  #     input: "test",
  #     cond: "msg == 'test'",
  #     true_case: "true",
  #     false_case: "false",
  #     ret: "ret",
  #   }
  #   EvalHelperTernaryTest.new.hoge(hash) # => return 'true'
  #
  # false case
  #
  #   class EvalHelperTernaryTest
  #     include EvalHelper
  #
  #     def hoge(hash)
  #       msg = hash[:input]
  #       code = \
  #         if hash[:ret]
  #           ternary_operator(hash[:cond], hash[:true_case], hash[:false_case], hash[:ret])
  #         else
  #           ternary_operator(hash[:cond], hash[:true_case], hash[:false_case])
  #         end
  #       instance_eval code
  #     end
  #   end
  #
  #   hash = {
  #     input: "not_test",
  #     cond: "msg == 'test'",
  #     true_case: "true",
  #     false_case: "false",
  #     ret: "ret",
  #   }
  #   EvalHelperTernaryTest.new.hoge(hash) # => return 'false'
  #
  def ternary_operator(condition, true_case, false_case, ret = nil)
    ret = ret.nil? ? '' : "#{ret} = "
    "#{ret}#{condition} ? #{true_case} : #{false_case}"
  end
end

# encoding: utf-8

module EvalHelper
  # create set variable logic strings, for eval
  #
  # ==== Examples
  #
  # set string variable case
  #
  #   class EvalHelperSetVariableTest
  #     include EvalHelper
  #
  #     def hoge(name, value)
  #       set_variable_code(name, value)
  #     end
  #   end
  #
  #   hash = {
  #     name: 'hoge',
  #     value: '"hoge"',
  #   }
  #   EvalHelperSetVariableTest.new.hoge(hash[:name], hash[:value])
  #
  # return
  #
  #   hoge = "hoge"
  #
  # set numeric variable case
  #
  #   class EvalHelperSetVariableTest
  #     include EvalHelper
  #
  #     def hoge(name, value)
  #       set_variable_code(name, value)
  #     end
  #   end
  #
  #   hash = {
  #     name: 'hoge_num',
  #     value: '1',
  #   }
  #   EvalHelperSetVariableTest.new.hoge(hash[:name], hash[:value])
  #
  # return
  #
  #   hoge_num = 1
  #
  def set_variable_code(name, value)
    "#{name} = #{value}"
  end
end

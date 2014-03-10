# encoding: utf-8

module EvalHelper
  # create set variables logic strings, for eval
  #
  # ==== Examples
  #
  # set string variables case
  #
  #   class EvalHelperSetVariablesTest
  #     include EvalHelper
  #
  #     def hoge(variables)
  #       set_variables_code(variables)
  #     end
  #   end
  #
  #   variables = [
  #     {
  #       name: 'name1',
  #       value: '"value1"',
  #     },
  #     {
  #       name: 'name2',
  #       value: '"value2"',
  #     },
  #   ]
  #   EvalHelperSetVariablesTest.new.hoge(variables)
  #
  # return
  #
  #   name1 = "value1"
  #   name2 = "value2"
  #
  def set_variables_code(variables)
    fail TypeError, "invalid type #{variables.class}. you have to use Array" unless variables.is_a? Array
    variables.reduce([]) do |ret, variable|
      fail TypeError, "invalid type #{variable.class}. you have to use Hash" unless variable.is_a? Hash
      fail TypeError, 'invalid hash. you have to set Hash[:name]' if variable[:name].nil?
      fail TypeError, 'invalid hash. you have to set Hash[:value]' if variable[:value].nil?
      ret << "#{variable[:name]} = #{variable[:value]}"
      ret
    end.join("\n")
  end
end

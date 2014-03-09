# encoding: utf-8
require 'spec_helper'
require 'eval_helper'

describe 'EvalHelper' do
  context :set_variable_code do
    class EvalHelperSetVariableTest
      include EvalHelper

      def hoge(name, value)
        set_variable_code(name, value)
      end
    end
    cases = [
      {
        case_no: 1,
        case_title: 'set string case',
        name: 'hoge',
        value: '"hoge"',
        expected: 'hoge = "hoge"'
      },
      {
        case_no: 2,
        case_title: 'set numeric case',
        name: 'hoge_num',
        value: '1',
        expected: 'hoge_num = 1'
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = EvalHelperSetVariableTest.new.hoge c[:name], c[:value]

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(c)
        # implement each case before
      end

      def case_after(c)
        # implement each case after
      end
    end
  end
end

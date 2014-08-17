# encoding: utf-8
require 'spec_helper'
require 'eval_helper'

describe 'EvalHelper' do
  context :ternary_operator do
    class EvalHelperTernaryTest
      include EvalHelper

      def hoge(hash)
        msg = hash[:input]
        code = \
          if hash[:ret]
            ternary_operator(hash[:cond], hash[:true_case], hash[:false_case], hash[:ret])
          else
            ternary_operator(hash[:cond], hash[:true_case], hash[:false_case])
          end
        instance_eval code
      end
    end
    cases = [
      {
        case_no: 1,
        case_title: 'true case',
        input: 'test',
        cond: "msg == 'test'",
        true_case: 'true',
        false_case: 'false',
        expected: true
      },
      {
        case_no: 2,
        case_title: 'false case',
        input: 'not_test',
        cond: "msg == 'test'",
        true_case: 'true',
        false_case: 'false',
        expected: false
      },
      {
        case_no: 3,
        case_title: 'true case with ret option',
        input: 'test',
        cond: "msg == 'test'",
        true_case: 'true',
        false_case: 'false',
        ret: 'result',
        expected: true
      },
      {
        case_no: 4,
        case_title: 'false case with ret option',
        input: 'not test',
        cond: "msg == 'test'",
        true_case: 'true',
        false_case: 'false',
        ret: 'result',
        expected: false
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          eval_helper = EvalHelperTernaryTest.new

          # -- when --
          actual = eval_helper.hoge(c)

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

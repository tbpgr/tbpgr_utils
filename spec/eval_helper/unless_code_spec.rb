# encoding: utf-8
require 'spec_helper'
require 'eval_helper'

describe 'EvalHelper' do
  context :unless_code do
    class EvalHelperUnlessTest
      include EvalHelper

      def hoge(hash)
        msg = hash[:input]
        code = unless_code(hash[:unless_cond], hash[:unless_proc], hash[:else_proc])
        instance_eval code
      end
    end
    cases = [
      {
        case_no: 1,
        case_title: 'unless case',
        input: 'not_test',
        unless_cond: "msg == 'test'",
        unless_proc: 'true',
        else_proc: 'false',
        expected: true
      },
      {
        case_no: 2,
        case_title: 'else case',
        input: 'test',
        unless_cond: "msg == 'test'",
        unless_proc: 'true',
        else_proc: 'false',
        expected: false
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          eval_helper = EvalHelperUnlessTest.new

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

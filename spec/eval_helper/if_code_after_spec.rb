# encoding: utf-8
require 'spec_helper'
require 'eval_helper'

describe 'EvalHelper' do
  context :if_code_after do
    class EvalHelperAfterTest
      include EvalHelper

      def hoge(hash)
        msg = hash[:input]
        code = if_code_after(hash[:if_cond], hash[:if_proc])
        ret = 'dafault'
        instance_eval code
        ret
      end
    end
    cases = [
      {
        case_no: 1,
        case_title: 'if case',
        input: 'test',
        if_cond: "msg == 'test'",
        if_proc: 'ret = "true"',
        expected: 'true',
      },
      {
        case_no: 2,
        case_title: 'else case',
        input: 'not_test',
        if_cond: "msg == 'test'",
        if_proc: 'ret = "true"',
        expected: 'dafault',
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          eval_helper = EvalHelperAfterTest.new

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

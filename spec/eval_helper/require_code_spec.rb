# encoding: utf-8
require 'spec_helper'
require 'eval_helper'

describe 'EvalHelper' do
  context :require_code do
    class EvalHelperRequireTest
      include EvalHelper

      def hoge(*args)
        require_code(args)
      end
    end
    cases = [
      {
        case_no: 1,
        case_title: 'single require case',
        inputs: 'tbpgr_utils',
        expected: "require 'tbpgr_utils'\n",
      },
      {
        case_no: 2,
        case_title: 'multi require case',
        inputs: ['tbpgr_utils', 'eval_helper'],
        expected: "require 'tbpgr_utils'\nrequire 'eval_helper'\n",
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          eval_helper = EvalHelperRequireTest.new

          # -- when --
          actual = eval_helper.hoge(c[:inputs])

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

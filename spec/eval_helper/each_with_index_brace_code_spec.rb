# encoding: utf-8
require 'spec_helper'
require 'eval_helper'

describe 'EvalHelper' do
  context :each_with_index_brace_code do
    class EvalHelperEachWithIndexBraceTest
      include EvalHelper

      def hoge(hash)
        each_with_index_brace_code(hash[:target], hash[:proc])
      end
    end
    cases = [
      {
        case_no: 1,
        case_title: 'unless case',
        target: '[:a, :b]',
        proc: 'puts "#{i}:#{v}"',
        expected: '[:a, :b].each_with_index { |v, i|puts "#{i}:#{v}" }'
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          eval_helper = EvalHelperEachWithIndexBraceTest.new

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

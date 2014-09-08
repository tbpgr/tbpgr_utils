# encoding: utf-8
require 'spec_helper'
require 'eval_helper'

describe 'EvalHelper' do
  context :each_with_index_do_code do
    class EvalHelperEachWithIndexDoTest
      include EvalHelper

      def hoge(hash)
        each_with_index_do_code(hash[:target], hash[:proc])
      end
    end
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        target: '[:a, :b]',
        proc: "puts \"\#{i}:\#{v}1\"\nputs \"\#{i}:\#{v}2\"\n",
        expected: "[:a, :b].each_with_index do |v, i|\n  puts \"\#{i}:\#{v}1\"\n  puts \"\#{i}:\#{v}2\"\nend"
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          eval_helper = EvalHelperEachWithIndexDoTest.new

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

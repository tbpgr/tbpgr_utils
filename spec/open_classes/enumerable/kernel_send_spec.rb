# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Enumerable do
  context :kernel_send do
    cases = [
      {
        case_no: 1,
        case_title: 'Array',
        input: [*1..3],
        method_name: :Rational,
        expected: [(1 / 1), (2 / 1), (3 / 1)]
      },
      {
        case_no: 2,
        case_title: 'Range',
        input: 1..3,
        method_name: :Rational,
        expected: [(1 / 1), (2 / 1), (3 / 1)]
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when/then --
          actual = c[:input].kernel_send c[:method_name]

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

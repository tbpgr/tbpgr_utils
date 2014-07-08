# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Numeric do
  context :dice_back do
    cases = [
      {
        case_no: 1,
        case_title: '1 case',
        input: 1,
        expected: 6
      },
      {
        case_no: 2,
        case_title: '2 case',
        input: 2,
        expected: 5
      },
      {
        case_no: 3,
        case_title: '3 case',
        input: 3,
        expected: 4
      },
      {
        case_no: 4,
        case_title: '4 case',
        input: 4,
        expected: 3
      },
      {
        case_no: 5,
        case_title: '5 case',
        input: 5,
        expected: 2
      },
      {
        case_no: 6,
        case_title: '6 case',
        input: 6,
        expected: 1
      },
      {
        case_no: 7,
        case_title: '7 case',
        input: 7,
        expected: 7
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = c[:input].dice_back

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

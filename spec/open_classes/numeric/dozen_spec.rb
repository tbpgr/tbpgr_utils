# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Numeric do
  context :dozen do
    cases = [
      {
        case_no: 1,
        case_title: '1 case',
        input: 1,
        expected: 12
      },
      {
        case_no: 2,
        case_title: '2 case',
        input: 2,
        expected: 24
      },
      {
        case_no: 3,
        case_title: '0 case',
        input: 0,
        expected: 0
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = c[:input].dozen

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

# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Object do
  context :boolean? do
    cases = [
      {
        case_no: 1,
        case_title: 'true case',
        input: true,
        expected: true,
      },
      {
        case_no: 2,
        case_title: 'false case',
        input: false,
        expected: true,
      },
      {
        case_no: 3,
        case_title: "string 'true' case",
        input: 'true',
        expected: false,
      },
      {
        case_no: 4,
        case_title: 'empty case',
        input: '',
        expected: false,
      },
      {
        case_no: 5,
        case_title: 'nil case',
        input: nil,
        expected: false,
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = c[:input].boolean?

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

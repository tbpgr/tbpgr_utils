# encoding: utf-8
require 'spec_helper'
require 'open_classes/string/ascii1_other2_size'

describe String do
  context :ascii1_other2_size do
    cases = [
      {
        case_no: 1,
        case_title: 'only ascii case',
        input: 'abc',
        expected: 3,
      },
      {
        case_no: 2,
        case_title: 'only other case',
        input: 'ａｂｃ',
        expected: 6,
      },
      {
        case_no: 3,
        case_title: 'mix case',
        input: 'aａbｂcｃ',
        expected: 9,
      },
      {
        case_no: 4,
        case_title: 'han-kana case',
        input: 'ｱﾝ',
        expected: 2,
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = c[:input].ascii1_other2_size

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

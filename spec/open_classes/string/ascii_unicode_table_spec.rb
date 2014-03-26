# encoding: utf-8
require 'spec_helper'
require 'open_classes/string/ascii_unicode_table'

describe String do
  context :ascii_unicode_table do
    cases = [
      {
        case_no: 1,
        case_title: '> case',
        input: 'aあb',
        expected: <<-EOS
|char|ASCII|ascii2 |Unicode|
| a  | 97  |1100001|  --   |
| あ | --  |  --   |0x3042 |
| b  | 98  |1100010|  --   |
        EOS
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = c[:input].ascii_unicode_table

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

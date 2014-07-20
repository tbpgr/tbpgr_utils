# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Array do
  context :to_table do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        inputs: [
          ['header1', 'header2', 'header3'],
          ['line1_1', 'line1_2', 'line1_3']
        ],
        expected: "|header1|header2|header3|\n|line1_1|line1_2|line1_3|\n"
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when/then --
          actual = c[:inputs].to_table

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

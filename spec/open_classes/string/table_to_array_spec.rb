# encoding: utf-8
require 'spec_helper'
require 'open_classes/string/table_to_array'
require 'open_classes/array/to_table'

describe String do
  context :table_to_array do
    cases = [
      {
        case_no: 1,
        case_title: '> case',
        input: [['header1', 'header2 ', 'header3'], ['line1_1', 'line1_2', 'line1_3']].to_table,
        expected: [['header1', 'header2', 'header3'], ['line1_1', 'line1_2', 'line1_3']]
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = c[:input].table_to_array

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

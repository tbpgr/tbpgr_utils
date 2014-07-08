# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Numeric do
  context :to_digit_table do
    cases = [
      {
        case_no: 1,
        case_title: '1-3 case',
        from: 1,
        to: 3,
        expected: <<-EOS
|10digit|  2digit|8digit|16digit|
|      1|00000001|     1|   0001|
|      2|00000010|     2|   0002|
|      3|00000011|     3|   0003|
        EOS
      },
      {
        case_no: 2,
        case_title: '255-256 case',
        from: 255,
        to: 256,
        expected: <<-EOS
|10digit|          2digit|8digit|16digit|
|    255|0000000011111111|   377|   00ff|
|    256|0000000100000000|   400|   0100|
        EOS
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = Numeric.to_digit_table(c[:from], c[:to])

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

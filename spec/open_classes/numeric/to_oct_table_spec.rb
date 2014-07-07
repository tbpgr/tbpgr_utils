# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Numeric do
  context :to_oct_table do
    cases = [
      {
        case_no: 1,
        case_title: '1-3 case',
        from: 1,
        to: 3,
        expected: <<-EOS
|10digit|8digit|
|      1|     1|
|      2|     2|
|      3|     3|
        EOS
      },
      {
        case_no: 2,
        case_title: '65535-65536 case',
        from: 65_535,
        to: 65_536,
        expected: <<-EOS
|10digit|8digit|
|  65535|177777|
|  65536|200000|
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
          actual = Numeric.to_oct_table(c[:from], c[:to])

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

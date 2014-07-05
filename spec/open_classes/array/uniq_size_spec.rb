# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Array do
  context :uniq_size do
    cases = [
      {
        case_no: 1,
        case_title: 'normal case',
        input: [*1..6] + [2, 3],
        expected: 6
      },
      {
        case_no: 2,
        case_title: 'not exist duplicate value case',
        input: [*1..6],
        expected: 6
      },
      {
        case_no: 3,
        case_title: 'empty case',
        input: [],
        expected: 0
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when/then --
          actual = c[:input].uniq_size

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

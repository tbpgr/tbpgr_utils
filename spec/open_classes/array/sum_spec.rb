# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Array do
  context :sum do
    cases = [
      {
        case_no: 1,
        case_title: 'numbers case',
        input: [*1..5],
        expected: 15
      },
      {
        case_no: 2,
        case_title: 'charactors case',
        input: [*'a'..'z'],
        expected: 'abcdefghijklmnopqrstuvwxyz'
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when/then --
          actual = c[:input].sum

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

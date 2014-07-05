# encoding: utf-8
require 'spec_helper'
require 'open_classes/string/uniq'

describe String do
  context :uniq do
    cases = [
      {
        case_no: 1,
        case_title: 'normal case',
        input: 'abcdac',
        expected: 'abcd'
      },
      {
        case_no: 2,
        case_title: 'not exist duplication case',
        input: 'abc',
        expected: 'abc'
      },
      {
        case_no: 3,
        case_title: 'empty case',
        input: '',
        expected: ''
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = c[:input].uniq

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

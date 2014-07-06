# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe String do
  context :say do
    cases = [
      {
        case_no: 1,
        case_title: 'default case',
        input: 'hoge',
        expected: "'hoge'"
      },
      {
        case_no: 2,
        case_title: 'quote case',
        input: 'hoge',
        option: :quote,
        expected: "'hoge'"
      },
      {
        case_no: 3,
        case_title: 'dquote case',
        input: 'hoge',
        option: :dquote,
        expected: '"hoge"'
      },
      {
        case_no: 4,
        case_title: 'bracket case',
        input: 'hoge',
        option: :bracket,
        expected: '[hoge]'
      },
      {
        case_no: 5,
        case_title: 'hyphen case',
        input: 'hoge',
        option: :hyphen,
        expected: '-hoge-'
      },
      {
        case_no: 6,
        case_title: 'error case',
        input: 'hoge',
        option: :invalid,
        expected: '-hoge-',
        expect_error: true
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          if c[:expect_error]
            lambda { c[:input].say(c[:option]) }.should raise_error(StandardError)
            next
          end
          actual = c[:option] ? c[:input].say(c[:option]) : c[:input].say

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

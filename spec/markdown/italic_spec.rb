# encoding: utf-8
require 'spec_helper'
require 'markdown/italic'

describe MarkdownString do
  context :italic do
    cases = [
      {
        case_no: 1,
        case_title: 'string case',
        input: 'italic',
        expected: '*italic*'
      },
      {
        case_no: 2,
        case_title: 'empty case',
        input: '',
        expected: '**'
      },
      {
        case_no: 3,
        case_title: 'nil case',
        input: nil,
        expected: '**'
      },
      {
        case_no: 4,
        case_title: 'not string case',
        input: 1,
        expected: 1
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = MarkdownString.italic c[:input]

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

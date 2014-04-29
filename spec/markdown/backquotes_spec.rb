# encoding: utf-8
require 'spec_helper'
require 'markdown/backquotes'

describe MarkdownString do
  context :backquotes do
    cases = [
      {
        case_no: 1,
        case_title: 'string case',
        input: "hoge\nhige\nhage\n",
        expected: ">hoge  \n>hige  \n>hage  \n"
      },
      {
        case_no: 2,
        case_title: 'not string case',
        input: 1,
        expected: 1,
      },
      {
        case_no: 3,
        case_title: 'empty case',
        input: '',
        expected: '>',
      },
      {
        case_no: 4,
        case_title: 'nil case',
        input: nil,
        expected: '>',
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = MarkdownString.backquotes c[:input]

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

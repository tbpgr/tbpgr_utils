# encoding: utf-8
require 'spec_helper'
require 'markdown/ul'

describe MarkdownString do
  context :ul do
    cases = [
      {
        case_no: 1,
        case_title: 'array case',
        input: %w{a b c},
        expected: <<-EOS
* a
* b
* c
        EOS
      },
      {
        case_no: 2,
        case_title: 'not list case',
        input: 'hoge',
        expected: 'hoge',
      },
      {
        case_no: 3,
        case_title: 'empty list case',
        input: [],
        expected: '',
      },
      {
        case_no: 4,
        case_title: 'each element nil case',
        input: [nil, nil, nil],
        expected: "* \n* \n* \n"
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = MarkdownString.ul c[:input]

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

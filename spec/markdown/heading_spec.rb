# encoding: utf-8
require 'spec_helper'
require 'markdown/heading'

describe MarkdownString do
  context :heading1 do
    cases = [
      {
        case_no: 1,
        case_title: 'normal case',
        input: 'header1',
        expected: '# header1',
      },
      {
        case_no: 2,
        case_title: 'empty case',
        input: '',
        expected: '# ',
      },
      {
        case_no: 3,
        case_title: 'nil case',
        input: '',
        expected: '# ',
      },
      {
        case_no: 4,
        case_title: 'not String case',
        input: 12_345,
        expected: '# 12345',
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = MarkdownString.heading1 c[:input]

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

  context :heading2 do
    cases = [
      {
        case_no: 1,
        case_title: 'normal case',
        input: 'heading2',
        expected: '## heading2',
      },
      {
        case_no: 2,
        case_title: 'empty case',
        input: '',
        expected: '## ',
      },
      {
        case_no: 3,
        case_title: 'nil case',
        input: '',
        expected: '## ',
      },
      {
        case_no: 4,
        case_title: 'not String case',
        input: 12_345,
        expected: '## 12345',
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = MarkdownString.heading2 c[:input]

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

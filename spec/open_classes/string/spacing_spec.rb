# encoding: utf-8
require 'spec_helper'
require 'open_classes/string/spacing'

describe String do
  context :spacing do
    cases = [
      {
        case_no: 1,
        case_title: 'no option case',
        input: 'hoge',
        expected: 'h o g e'
      },
      {
        case_no: 2,
        case_title: 'with char and size options case',
        input: 'hoge',
        options: {
          char: '_',
          size: 2
        },
        expected: 'h__o__g__e'
      },
      {
        case_no: 3,
        case_title: 'invalid options case',
        input: 'hoge',
        options: {
          invalid_char: '_',
          invalid_size: 2
        },
        expected: 'h o g e'
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = c[:options] ? c[:input].spacing(c[:options]) : c[:input].spacing

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

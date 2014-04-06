# encoding: utf-8
require 'spec_helper'
require 'open_classes/string/escape_double_quote'

describe String do
  context :escape_double_quote do
    cases = [
      {
        case_no: 1,
        case_title: 'exist double quote case',
        input: 'hoge"h"ige',
        expected: 'hoge""h""ige',
      },
      {
        case_no: 2,
        case_title: 'not exist double quote case',
        input: 'hogehige',
        expected: 'hogehige',
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = c[:input].escape_double_quote

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

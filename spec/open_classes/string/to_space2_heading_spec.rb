# encoding: utf-8
require 'spec_helper'
require 'open_classes/string/to_space2_heading'

describe String do
  context :to_space2_heading do
    cases = [
      {
        case_no: 1,
        case_title: '> case',
        input: 'hoge>hige',
        expected: "hoge\n  hige",
      },
      {
        case_no: 2,
        case_title: '+ case',
        input: 'hoge+hige',
        expected: "hoge\nhige",
      },
      {
        case_no: 3,
        case_title: '^ case',
        input: 'hoge>hige^hege',
        expected: "hoge\n  hige\nhege",
      },
      {
        case_no: 4,
        case_title: 'mix case',
        input: 'hoge>hige1+hige2^hege',
        expected: "hoge\n  hige1\n  hige2\nhege",
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = c[:input].to_space2_heading

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

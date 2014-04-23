# encoding: utf-8
require 'spec_helper'
require 'markdown/heading'

describe MarkdownString do
  [*1..6].each do |i|
    context "heading#{i.to_s}" do
      cases = [
        {
          case_no: 1,
          case_title: 'normal case',
          input: "heading#{i.to_s}",
          expected: "#{'#'*i} heading#{i.to_s}",
        },
        {
          case_no: 2,
          case_title: 'empty case',
          input: '',
          expected: "#{'#'*i} ",
        },
        {
          case_no: 3,
          case_title: 'nil case',
          input: '',
          expected: "#{'#'*i} ",
        },
        {
          case_no: 4,
          case_title: 'not String case',
          input: 12_345,
          expected: "#{'#'*i} 12345",
        },
      ]

      cases.each do |c|
        it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
          begin
            case_before c

            # -- given --
            # nothing

            # -- when --
            actual = MarkdownString.send "heading#{i.to_s}", c[:input]

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
end

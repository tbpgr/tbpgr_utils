# encoding: utf-8
require 'spec_helper'
require 'markdown/link'

describe MarkdownString do
  context :link do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        label: 'label',
        url: 'http://not_exists.com',
        expected: '[label](http://not_exists.com)'
      },
      {
        case_no: 2,
        case_title: 'empty case',
        label: '',
        url: '',
        expected: '[]()'
      },
      {
        case_no: 3,
        case_title: 'nil case',
        label: nil,
        url: nil,
        expected: '[]()'
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = MarkdownString.link c[:label], c[:url]

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

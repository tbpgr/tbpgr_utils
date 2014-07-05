# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe String do
  context :surround do
    cases = [
      {
        case_no: 1,
        case_title: 'single line, no option case',
        input: 'hoge',
        expected: <<-EOS
------
|hoge|
------
        EOS
      },
      {
        case_no: 2,
        case_title: 'multi line, no option case',
        input: "hoge\na",
        expected: <<-EOS
------
|hoge|
|a   |
------
        EOS
      },
      {
        case_no: 3,
        case_title: 'empty, no option case',
        input: '',
        expected: <<-EOS
--
--
        EOS
      },
      {
        case_no: 4,
        case_title: 'single line, both option case',
        input: 'hoge',
        options: { top_bottom: '=', side: '!' },
        expected: <<-EOS
======
!hoge!
======
        EOS
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = c[:options] ? c[:input].surround(c[:options]) : c[:input].surround

          # -- then --
          expect(actual).to eq(c[:expected].chop)
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

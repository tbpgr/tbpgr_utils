# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe String do
  context :surround do
    cases = [
      {
        case_no: 1,
        case_title: 'default case',
        input: 'hoge',
        expected: 'HoGe'
      },
      {
        case_no: 2,
        case_title: 'lower cap case',
        input: 'hoge',
        option: :lower_cap,
        expected: 'hOgE'
      },
      {
        case_no: 3,
        case_title: 'empty case',
        input: '',
        expected: ''
      },
      {
        case_no: 4,
        case_title: 'nil case',
        input: nil,
        expected: nil
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = c[:option] ? c[:input].stripe(c[:option]) : c[:input].stripe

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

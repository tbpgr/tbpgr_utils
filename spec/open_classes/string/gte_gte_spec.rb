# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe String do
  context :>> do
    cases = [
      {
        case_no: 1,
        case_title: 'string method case',
        input: 'abc',
        method_name: 'ord',
        expected: [97, 98, 99],
      },
      {
        case_no: 2,
        case_title: 'symbol case',
        input: 'abc',
        method_name: :ord,
        expected: [97, 98, 99],
      },
      {
        case_no: 3,
        case_title: 'proc case',
        input: 'abc',
        method_name: proc { |x|(x.ord + 2).chr },
        expected: ['c', 'd', 'e'],
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when/then --
          actual = c[:input] >> c[:method_name]

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

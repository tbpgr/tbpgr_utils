# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Array do
  context :>> do
    cases = [
      {
        case_no: 1,
        case_title: 'no args case',
        input: [*'a'..'c'],
        method_name: :ord,
        expected: [97, 98, 99],
      },
      {
        case_no: 3,
        case_title: 'have args case',
        input: [*'aa'..'ac'],
        method_name: 'gsub',
        args: ['a', 'c'],
        expected: ['cc', 'cb', 'cc'],
      },
      {
        case_no: 4,
        case_title: 'have args case',
        input: [*'aa'..'ac'],
        method_name: 'to_a',
        expected: [*'aa'..'ac'],
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when/then --
          if c[:args]
            actual = c[:input].>>.send c[:method_name], *c[:args]
          else
            actual = c[:input].>>.send c[:method_name]
          end

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

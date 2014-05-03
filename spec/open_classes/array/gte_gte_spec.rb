# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Array do
  context :>> do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        input: [*'a'..'c'],
        method_name: :ord,
        expected: [97, 98, 99],
      },
      {
        case_no: 2,
        case_title: 'valid case',
        input: [*'a'..'c'],
        method_name: 'ord',
        expected: [97, 98, 99],
      },
      {
        case_no: 3,
        case_title: 'valid case',
        input: [*'a'..'c'],
        method_name: 1,
        expected: [*'a'..'c'],
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

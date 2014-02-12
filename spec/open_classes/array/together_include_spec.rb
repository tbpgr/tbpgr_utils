# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Array do
  context :together_include? do
    cases = [
      {
        case_no: 1,
        case_title: 'both include single ret case',
        inputs: [[*1..5], [*5..9]],
        value: 5,
        method_name: :together_include?,
        expected: true,
        is_multi: false,
      },
      {
        case_no: 2,
        case_title: 'one include single ret case',
        inputs: [[*1..5], [*5..9]],
        value: 9,
        method_name: :together_include?,
        expected: true,
        is_multi: false,
      },
      {
        case_no: 3,
        case_title: 'both not include single ret case',
        inputs: [[*1..5], [*5..9]],
        value: 10,
        method_name: :together_include?,
        expected: false,
        is_multi: false,
      },
      {
        case_no: 4,
        case_title: 'both include multi ret case',
        inputs: [[*1..5], [*5..9]],
        value: 5,
        method_name: :together_include?,
        expected: [true, true],
        is_multi: true,
      },
      {
        case_no: 5,
        case_title: 'one include multi ret case',
        inputs: [[*1..5], [*5..9]],
        value: 9,
        method_name: :together_include?,
        expected: [false, true],
        is_multi: true,
      },
      {
        case_no: 6,
        case_title: 'both not include multi ret case',
        inputs: [[*1..5], [*5..9]],
        value: 10,
        method_name: :together_include?,
        expected: [false, false],
        is_multi: true,
      },
      {
        case_no: 7,
        case_title: 'both include single ret case(alias tinclude?)',
        inputs: [[*1..5], [*5..9]],
        value: 5,
        method_name: :tinclude?,
        expected: true,
        is_multi: false,
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = c[:inputs].send c[:method_name], c[:value], c[:is_multi]

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

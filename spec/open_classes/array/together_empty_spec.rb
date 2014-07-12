# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Array do
  context :together_empty? do
    cases = [
      {
        case_no: 1,
        case_title: 'empty case',
        inputs: [[], []],
        method_name: :together_empty?,
        expected: true
      },
      {
        case_no: 2,
        case_title: 'not empty case',
        inputs: [[1], []],
        method_name: :together_empty?,
        expected: false
      },
      {
        case_no: 3,
        case_title: 'empty case(alias tempty?)',
        inputs: [[], []],
        method_name: :tempty?,
        expected: true
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = c[:inputs].send c[:method_name]

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

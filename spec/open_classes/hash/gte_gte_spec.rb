# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Hash do
  context :>> do
    cases = [
      {
        case_no: 1,
        case_title: 'no args case',
        input: { key1: 'value1', key2: 'value2' },
        method_name: :upcase,
        expected: { key1: 'VALUE1', key2: 'VALUE2' },
      },
      {
        case_no: 2,
        case_title: 'have args case',
        input: { key1: 'value1', key2: 'value2' },
        method_name: :+,
        args: '_hoge',
        expected: { key1: 'value1_hoge', key2: 'value2_hoge' },
      },
      {
        case_no: 3,
        case_title: 'to_h case',
        input: { key1: 'value1', key2: 'value2' },
        method_name: :to_h,
        expected: { key1: 'value1', key2: 'value2' },
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

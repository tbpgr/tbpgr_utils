# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Symbol do
  context :is_meta_variable? do
    cases = [
      {
        case_no: 1,
        case_title: 'meta variable foo case',
        input: :foo,
        expected: true
      },
      {
        case_no: 2,
        case_title: 'meta variable bar case',
        input: :bar,
        expected: true
      },
      {
        case_no: 3,
        case_title: 'meta variable baz case',
        input: :baz,
        expected: true
      },
      {
        case_no: 4,
        case_title: 'not meta variable case',
        input: :aaa,
        expected: false
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          if c[:expect_error]
            lambda { c[:input].is_meta_variable?(c[:option]) }.should raise_error(StandardError)
            next
          end
          actual = c[:option] ? c[:input].is_meta_variable?(c[:option]) : c[:input].is_meta_variable?

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

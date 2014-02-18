# encoding: utf-8
require 'spec_helper'
require 'metasyntactic_variable'

describe MetasyntacticVariable do
  context :meta_variables do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        expected: [:foo, :bar, :baz, :qux, :quux, :corge, :grault, :garply, :waldo, :fred, :plugh, :xyzzy, :thud],
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual_method = MetasyntacticVariable.meta_variables
          actual_constants = MetasyntacticVariable::META_VARIABLES

          # -- then --
          expect(actual_method).to eq(c[:expected])
          expect(actual_constants).to eq(c[:expected])
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

  context :meta_classes do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        expected: [:Foo, :Bar, :Baz, :Qux, :Quux, :Corge, :Grault, :Garply, :Waldo, :Fred, :Plugh, :Xyzzy, :Thud],
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual_method = MetasyntacticVariable.meta_classes
          actual_constants = MetasyntacticVariable::META_CLASSES

          # -- then --
          expect(actual_method).to eq(c[:expected])
          expect(actual_constants).to eq(c[:expected])
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

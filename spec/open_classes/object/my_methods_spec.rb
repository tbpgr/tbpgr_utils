# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Object do
  context :my_methods do
    SampleClass = Class.new(String) do
      def public_hello
        "#{self} public hello"
      end

      protected

      def protected_hello
        "#{self} protected hello"
      end

      private

      def private_hello
        "#{self} private hello"
      end
    end

    cases = [
      {
        case_no: 1,
        case_title: 'true case',
        input: SampleClass.new,
        expected: [:public_hello, :protected_hello, :private_hello]
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = c[:input].my_methods

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

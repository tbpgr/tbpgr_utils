# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Object do
  context :boolean? do
    cases = [
      {
        case_no: 1,
        case_title: 'true case',
        input: true,
        expected: true,
      },
      {
        case_no: 2,
        case_title: 'false case',
        input: false,
        expected: true,
      },
      {
        case_no: 3,
        case_title: "string 'true' case",
        input: 'true',
        expected: false,
      },
      {
        case_no: 4,
        case_title: 'empty case',
        input: '',
        expected: false,
      },
      {
        case_no: 5,
        case_title: 'nil case',
        input: nil,
        expected: false,
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = c[:input].boolean?

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
        expected: [:public_hello, :protected_hello, :private_hello],
      },
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


  context :any_of? do
    cases = [
      {
        case_no: 1,
        case_title: 'true case',
        input: 'hoge',
        check: %w{hoge hige},
        expected: true,
      },
      {
        case_no: 2,
        case_title: 'true case',
        input: 'hige',
        check: %w{hoge hige},
        expected: true,
      },
      {
        case_no: 3,
        case_title: 'false case',
        input: 'hege',
        check: %w{hoge hige},
        expected: false,
      },
      {
        case_no: 4,
        case_title: 'number true case',
        input: 1,
        check: [1, 2, 3, 4, 5],
        expected: true,
      },
      {
        case_no: 5,
        case_title: 'number true case',
        input: 6,
        check: [1, 2, 3, 4, 5],
        expected: false,
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = c[:input].any_of?(*c[:check])

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

  context :to_bool do
    cases = [
      {
        case_no: 1,
        case_title: 'TrueClass case',
        input: true,
        expected: true,
      },
      {
        case_no: 2,
        case_title: 'FalseClass case',
        input: false,
        expected: false,
      },
      {
        case_no: 3,
        case_title: "string 'true' case",
        input: 'true',
        expected: true,
      },
      {
        case_no: 4,
        case_title: "string 'false' case",
        input: 'false',
        expected: true,
      },
      {
        case_no: 5,
        case_title: 'empty case',
        input: '',
        expected: true,
      },
      {
        case_no: 6,
        case_title: 'nil case',
        input: nil,
        expected: false,
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = c[:input].to_bool

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

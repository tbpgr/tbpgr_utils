# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Array do
  context :together do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        inputs: [[1, 2, 3], %w{one two three}],
        expected: ['1:one', '2:two', '3:three'],
      },
      {
        case_no: 2,
        case_title: 'contain nil case',
        inputs: [[1, 2, 3], %w{one two}],
        expected: ['1:one', '2:two', '3:'],
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when/then --
          actual = []
          c[:inputs].together do |first, second|
            actual << "#{first}:#{second}"
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

  context :together_with_index do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        inputs: [[1, 2, 3], %w{one two three}],
        expected: ['0:1:one', '1:2:two', '2:3:three'],
      },
      {
        case_no: 2,
        case_title: 'contain nil case',
        inputs: [[1, 2, 3], %w{one two}],
        expected: ['0:1:one', '1:2:two', '2:3:'],
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when/then --
          actual = []
          c[:inputs].together_with_index do |first, second, index|
            actual << "#{index.to_s}:#{first}:#{second}"
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

  context :together_map do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        method_name: :together_map, 
        inputs: [[1, 2, 3], %w{one two three}],
        expected: ['1:one', '2:two', '3:three'],
      },
      {
        case_no: 2,
        case_title: 'contain nil case',
        method_name: :together_map, 
        inputs: [[1, 2, 3], %w{one two}],
        expected: ['1:one', '2:two', '3:'],
      },
      {
        case_no: 3,
        case_title: 'valid case',
        method_name: :together_map, 
        inputs: [[1, 2, 3], %w{one two three}],
        expected: [['1:one', '2:two', '3:three'], ['one:1', 'two:2', 'three:3']],
        is_multi: true,
      },
      {
        case_no: 4,
        case_title: 'valid case(alias together_collect)',
        method_name: :together_collect, 
        inputs: [[1, 2, 3], %w{one two three}],
        expected: ['1:one', '2:two', '3:three'],
      },
      {
        case_no: 5,
        case_title: 'valid case(alias tmap)',
        method_name: :tmap, 
        inputs: [[1, 2, 3], %w{one two three}],
        expected: ['1:one', '2:two', '3:three'],
      },
      {
        case_no: 6,
        case_title: 'valid case(alias tcollect)',
        method_name: :tcollect, 
        inputs: [[1, 2, 3], %w{one two three}],
        expected: ['1:one', '2:two', '3:three'],
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when/then --
          if c[:is_multi]
            actual = c[:inputs].method(c[:method_name]).call {|first, second|["#{first}:#{second}", "#{second}:#{first}"]}
          else
            actual = c[:inputs].method(c[:method_name]).call {|first, second|"#{first}:#{second}"}
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

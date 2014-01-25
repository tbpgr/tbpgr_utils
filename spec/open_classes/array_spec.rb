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
            actual = c[:inputs].method(c[:method_name]).call { |first, second|["#{first}:#{second}", "#{second}:#{first}"] }
          else
            actual = c[:inputs].method(c[:method_name]).call { |first, second|"#{first}:#{second}" }
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

  context :together_select do
    cases = [
      {
        case_no: 1,
        case_title: 'single valid case',
        inputs: [[1, 2, 3, 4], [4, 2, 3, 1]],
        condition: 'first == second',
        method_name: :together_select,
        expected: [[2, 3], [2, 3]],
      },
      {
        case_no: 2,
        case_title: 'multi valid case',
        inputs: [[1, 2, 3, 4], [4, 2, 3, 1]],
        condition: '[first.odd?, second.even?]',
        expected: [[1, 3], [4, 2]],
        method_name: :together_select,
      },
      {
        case_no: 3,
        case_title: 'multi valid case',
        inputs: [[1, 2, 3, 4], [4, 2, 3, 1]],
        condition: '[first.odd?, second.even?]',
        expected: [[1, 3], [4, 2]],
        method_name: :tselect,
      },
      {
        case_no: 4,
        case_title: 'multi valid case',
        inputs: [[1, 2, 3, 4], [4, 2, 3, 1]],
        condition: '[first.odd?, second.even?]',
        expected: [[1, 3], [4, 2]],
        method_name: :together_find_all,
      },
      {
        case_no: 5,
        case_title: 'multi valid case',
        inputs: [[1, 2, 3, 4], [4, 2, 3, 1]],
        condition: '[first.odd?, second.even?]',
        expected: [[1, 3], [4, 2]],
        method_name: :tfindall,
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when/then --
          actual = c[:inputs].method(c[:method_name]).call { |first, second| eval c[:condition], binding }

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

  context :together_reduce do
    cases = [
      {
        case_no: 1,
        case_title: 'single valid case',
        inputs: [[1, 2, 3, 4], [4, 2, 3, 1]],
        init: nil,
        logic: 'memo + first + second',
        method_name: :together_reduce,
        expected: 20,
      },
      {
        case_no: 2,
        case_title: 'single with init valid case',
        inputs: [[1, 2, 3, 4], [4, 2, 3, 1]],
        init: 10,
        logic: 'memo + first + second',
        method_name: :together_reduce,
        expected: 30,
      },
      {
        case_no: 5,
        case_title: 'single valid case',
        inputs: [[1, 2, 3, 4], [4, 2, 3, 1]],
        logic: 'memo + first + second',
        expected: 20,
        method_name: :treduce,
      },
      {
        case_no: 6,
        case_title: 'single valid case',
        inputs: [[1, 2, 3, 4], [4, 2, 3, 1]],
        logic: 'memo + first + second',
        expected: 20,
        method_name: :together_inject,
      },
      {
        case_no: 7,
        case_title: 'multi valid case',
        inputs: [[1, 2, 3, 4], [4, 2, 3, 1]],
        logic: 'memo + first + second',
        expected: 20,
        method_name: :tinject,
      },
      {
        case_no: 8,
        case_title: 'single with init valid array case',
        inputs: [[1, 2, 3, 4], [4, 2, 3, 1]],
        init: [],
        logic: 'memo << first + second',
        method_name: :together_reduce,
        expected: [5, 4, 6, 5],
      },
      {
        case_no: 9,
        case_title: 'single with init valid array case',
        inputs: [[1, 2, 3, 4], [4, 2, 3, 1]],
        init: {},
        logic: 'memo[first] = second; memo',
        method_name: :together_reduce,
        expected: { 1 => 4, 2 => 2, 3 => 3, 4 => 1 },
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when/then --
          if c[:init]
            actual = c[:inputs].method(c[:method_name]).call(c[:init]) { |memo, first, second| eval c[:logic], binding }
          else
            actual = c[:inputs].method(c[:method_name]).call { |memo, first, second| eval c[:logic], binding }
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

  context :together_concat do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        inputs: [[1, 2, 3], %w{one two three}],
        add_list: [4, 5, 6],
        expected: [[1, 2, 3, 4, 5, 6], ['one', 'two', 'three', 4, 5, 6]],
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          c[:inputs].together_concat c[:add_list]

          # -- then --
          expect(c[:inputs]).to eq(c[:expected])
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

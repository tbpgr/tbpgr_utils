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

  context :together_map! do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        method_name: :together_map!,
        inputs: [[1, 2, 3], %w{one two three}],
        expected_ret: ['1:one', '2:two', '3:three'],
        expected_self: ['1:one', '2:two', '3:three'],
      },
      {
        case_no: 2,
        case_title: 'contain nil case',
        method_name: :together_map!,
        inputs: [[1, 2, 3], %w{one two}],
        expected_ret: ['1:one', '2:two', '3:'],
        expected_self: ['1:one', '2:two', '3:'],
      },
      {
        case_no: 3,
        case_title: 'valid case',
        method_name: :together_map!,
        inputs: [[1, 2, 3], %w{one two three}],
        expected_ret: [['1:one', '2:two', '3:three'], ['one:1', 'two:2', 'three:3']],
        expected_self: [['1:one', '2:two', '3:three'], ['one:1', 'two:2', 'three:3']],
        is_multi: true,
      },
      {
        case_no: 4,
        case_title: 'valid case(alias together_collect!)',
        method_name: :together_collect!,
        inputs: [[1, 2, 3], %w{one two three}],
        expected_ret: [['1:one', '2:two', '3:three'], ['one:1', 'two:2', 'three:3']],
        expected_self: [['1:one', '2:two', '3:three'], ['one:1', 'two:2', 'three:3']],
        is_multi: true,
      },
      {
        case_no: 5,
        case_title: 'valid case(alias tmap!)',
        method_name: :tmap!,
        inputs: [[1, 2, 3], %w{one two three}],
        expected_ret: [['1:one', '2:two', '3:three'], ['one:1', 'two:2', 'three:3']],
        expected_self: [['1:one', '2:two', '3:three'], ['one:1', 'two:2', 'three:3']],
        is_multi: true,
      },
      {
        case_no: 6,
        case_title: 'valid case(alias tcollect!)',
        method_name: :tcollect!,
        inputs: [[1, 2, 3], %w{one two three}],
        expected_ret: [['1:one', '2:two', '3:three'], ['one:1', 'two:2', 'three:3']],
        expected_self: [['1:one', '2:two', '3:three'], ['one:1', 'two:2', 'three:3']],
        is_multi: true,
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

          expect(actual).to eq(c[:expected_ret])
          expect(c[:inputs]).to eq(c[:expected_self])
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
        method_name: :together_concat,
        expected: [[1, 2, 3, 4, 5, 6], ['one', 'two', 'three', 4, 5, 6]],
      },
      {
        case_no: 2,
        case_title: 'valid case',
        inputs: [[1, 2, 3], %w{one two three}],
        add_list: [4, 5, 6],
        method_name: :tconcat,
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
          c[:inputs].send c[:method_name], c[:add_list]

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

  context :together_at do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        inputs: [[1, 2, 3], %w{one two three}],
        index: 2,
        method_name: :together_at,
        expected: [3, 'three'],
      },
      {
        case_no: 2,
        case_title: 'contain nil case',
        inputs: [[1, 2, 3], %w{one two}],
        index: 2,
        method_name: :together_at,
        expected: [3, nil],
      },
      {
        case_no: 3,
        case_title: 'valid case',
        inputs: [[1, 2, 3], %w{one two three}],
        index: 2,
        method_name: :tat,
        expected: [3, 'three'],
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = c[:inputs].send c[:method_name], c[:index]

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

  context :together_clear do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        inputs: [[1, 2, 3], %w{one two three}],
        method_name: :together_clear,
        expected: [[], []],
      },
      {
        case_no: 2,
        case_title: 'valid case',
        inputs: [[1, 2, 3], %w{one two three}],
        method_name: :tclear,
        expected: [[], []],
      },
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

  context :together_compact do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        inputs: [[1, 2, nil, 3], ['a', 'b', 'c', nil, 'd']],
        method_name: :together_compact,
        expected_self: [[1, 2, nil, 3], ['a', 'b', 'c', nil, 'd']],
        expected_ret: [[1, 2, 3], ['a', 'b', 'c', 'd']],
      },
      {
        case_no: 2,
        case_title: 'valid case(use alias tcompact)',
        inputs: [[1, 2, nil, 3], ['a', 'b', 'c', nil, 'd']],
        method_name: :tcompact,
        expected_self: [[1, 2, nil, 3], ['a', 'b', 'c', nil, 'd']],
        expected_ret: [[1, 2, 3], ['a', 'b', 'c', 'd']],
      },
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
          expect(c[:inputs]).to eq(c[:expected_self])
          expect(actual).to eq(c[:expected_ret])
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

  context :together_compact! do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        inputs: [[1, 2, nil, 3], ['a', 'b', 'c', nil, 'd']],
        method_name: :together_compact!,
        expected_self: [[1, 2, 3], ['a', 'b', 'c', 'd']],
        expected_ret: [[1, 2, 3], ['a', 'b', 'c', 'd']],
      },
      {
        case_no: 2,
        case_title: 'valid case(use alias tcompact)',
        inputs: [[1, 2, nil, 3], ['a', 'b', 'c', nil, 'd']],
        method_name: :tcompact!,
        expected_self: [[1, 2, 3], ['a', 'b', 'c', 'd']],
        expected_ret: [[1, 2, 3], ['a', 'b', 'c', 'd']],
      },
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
          expect(c[:inputs]).to eq(c[:expected_self])
          expect(actual).to eq(c[:expected_ret])
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

  context :together_delete do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        inputs: [[1, 2, 3, 4], [2, 3, 4, 5]],
        delete_value: 2,
        method_name: :together_delete,
        expected: [[1, 3, 4], [3, 4, 5]],
        ret: 2,
      },
      {
        case_no: 2,
        case_title: 'valid case(not exist and block use)',
        inputs: [[1, 2, 3, 4], [2, 3, 4, 5]],
        delete_value: 6,
        method_name: :together_delete,
        expected: [[1, 2, 3, 4], [2, 3, 4, 5]],
        ret: :ret,
        has_block: true,
        block: :ret,
      },
      {
        case_no: 3,
        case_title: 'valid case(not exist and block unuse)',
        inputs: [[1, 2, 3, 4], [2, 3, 4, 5]],
        delete_value: 6,
        method_name: :together_delete,
        expected: [[1, 2, 3, 4], [2, 3, 4, 5]],
        ret: nil,
      },
      {
        case_no: 4,
        case_title: 'valid case(alias tdelete)',
        inputs: [[1, 2, 3, 4], [2, 3, 4, 5]],
        delete_value: 2,
        method_name: :tdelete,
        expected: [[1, 3, 4], [3, 4, 5]],
        ret: 2,
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          if c[:has_block]
            actual = c[:inputs].send c[:method_name], c[:delete_value] {c[:block] }
          else
            actual = c[:inputs].send c[:method_name], c[:delete_value]
          end

          # -- then --
          expect(actual).to eq(c[:ret])
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

  context :together_delete_at do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        inputs: [[1, 2, 3, 4], [2, 3, 4, 5]],
        delete_value: 2,
        method_name: :together_delete_at,
        expected: [[1, 2, 4], [2, 3, 5]],
        ret: [3, 4],
      },
      {
        case_no: 2,
        case_title: 'valid case(not exist)',
        inputs: [[1, 2, 3, 4], [2, 3, 4, 5]],
        delete_value: 5,
        method_name: :together_delete_at,
        expected: [[1, 2, 3, 4], [2, 3, 4, 5]],
        ret: [nil, nil],
      },
      {
        case_no: 3,
        case_title: 'valid case(minus index)',
        inputs: [[1, 2, 3, 4], [2, 3, 4, 5]],
        delete_value: -3,
        method_name: :together_delete_at,
        expected: [[1, 3, 4], [2, 4, 5]],
        ret: [2, 3],
      },
      {
        case_no: 4,
        case_title: 'valid case(use tdelete_at alias)',
        inputs: [[1, 2, 3, 4], [2, 3, 4, 5]],
        delete_value: 2,
        method_name: :tdelete_at,
        expected: [[1, 2, 4], [2, 3, 5]],
        ret: [3, 4],
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          if c[:has_block]
            actual = c[:inputs].send c[:method_name], c[:delete_value] {c[:block] }
          else
            actual = c[:inputs].send c[:method_name], c[:delete_value]
          end

          # -- then --
          expect(actual).to eq(c[:ret])
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

  context :together_delete_if do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        inputs: [[1, 2, 3, 4], [6, 4, 6, 8]],
        delete_block_code: '(first + second).odd?',
        method_name: :together_delete_if,
        expected: [[2, 4], [4, 8]],
      },
      {
        case_no: 2,
        case_title: 'not have delete target value case',
        inputs: [[2, 2, 4, 4], [6, 4, 6, 8]],
        delete_block_code: '(first + second).odd?',
        method_name: :together_delete_if,
        expected: nil,
      },
      {
        case_no: 3,
        case_title: 'valid case(alias tdelete_if)',
        inputs: [[1, 2, 3, 4], [6, 4, 6, 8]],
        delete_block_code: '(first + second).odd?',
        method_name: :tdelete_if,
        expected: [[2, 4], [4, 8]],
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = c[:inputs].send c[:method_name] {|first, second|eval c[:delete_block_code], binding }

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

  context :together_empty? do
    cases = [
      {
        case_no: 1,
        case_title: 'empty case',
        inputs: [[], []],
        method_name: :together_empty?,
        expected: true,
      },
      {
        case_no: 2,
        case_title: 'not empty case',
        inputs: [[1], []],
        method_name: :together_empty?,
        expected: false,
      },
      {
        case_no: 3,
        case_title: 'empty case(alias tempty?)',
        inputs: [[], []],
        method_name: :tempty?,
        expected: true,
      },
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

  context :together_fill do
    cases = [
      {
        case_no: 1,
        case_title: 'not use block case',
        inputs: [[*1..5], [*6..10]],
        fill_value: 99,
        method_name: :together_fill,
        expected: [[99, 99, 99, 99, 99], [99, 99, 99, 99, 99]],
        has_block: false,
      },
      {
        case_no: 2,
        case_title: 'use block, no args case',
        inputs: [[*1..5], [*6..10]],
        fill_value: nil,
        method_name: :together_fill,
        expected: [[2, 3, 4, 5, 6], [2, 3, 4, 5, 6]],
        block_logic: '(i + 1) + 1',
        has_block: true,
      },
      {
        case_no: 3,
        case_title: 'use block, has args case',
        inputs: [[*1..5], [*6..10]],
        fill_value: 2,
        method_name: :together_fill,
        expected: [[1, 2, 4, 5, 6], [6, 7, 4, 5, 6]],
        block_logic: '(i + 1) + 1',
        has_block: true,
      },
      {
        case_no: 4,
        case_title: 'not use block case(alias tfill)',
        inputs: [[*1..5], [*6..10]],
        fill_value: 99,
        method_name: :tfill,
        expected: [[99, 99, 99, 99, 99], [99, 99, 99, 99, 99]],
        has_block: false,
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          if c[:has_block]
            actual = c[:inputs].send c[:method_name], c[:fill_value] {|i|eval c[:block_logic], binding }
          else
            actual = c[:inputs].send c[:method_name], c[:fill_value]
          end

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


  context :together_first do
    cases = [
      {
        case_no: 1,
        case_title: 'not args case',
        inputs: [[*1..5], [*6..10]],
        method_name: :together_first,
        expected: [1, 6],
        has_args: false,
      },
      {
        case_no: 2,
        case_title: 'has args 2 case',
        inputs: [[*1..5], [*6..10]],
        args: 2,
        method_name: :together_first,
        expected: [[1, 2], [6, 7]],
        has_args: true,
      },
      {
        case_no: 3,
        case_title: 'has args 0 case',
        inputs: [[*1..5], [*6..10]],
        args: 0,
        method_name: :together_first,
        expected: [[], []],
        has_args: true,
      },
      {
        case_no: 4,
        case_title: 'has args over size case',
        inputs: [[*1..5], [*6..10]],
        args: 6,
        method_name: :together_first,
        expected: [[*1..5], [*6..10]],
        has_args: true,
      },
      {
        case_no: 5,
        case_title: 'not args case(alias tfirst)',
        inputs: [[*1..5], [*6..10]],
        method_name: :tfirst,
        expected: [1, 6],
        has_args: false,
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          if c[:has_args]
            actual = c[:inputs].send c[:method_name], c[:args]
          else
            actual = c[:inputs].send c[:method_name]
          end

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

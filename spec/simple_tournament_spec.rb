# encoding: utf-8
require 'spec_helper'
require 'simple_tournament'

describe SimpleTournament do
  context :new do
    cases = [
      {
        case_no: 1,
        case_title: '3 case',
        number: 3,
        expected: [[nil], [nil, nil], [nil, nil]],
      },
      {
        case_no: 2,
        case_title: '4 case',
        number: 4,
        expected: [[nil], [nil, nil], [nil, nil, nil, nil]],
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          simple_tournament = SimpleTournament.new c[:number]

          # -- then --
          actual = simple_tournament.tournament
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

  context :apply_challengers do
    cases = [
      {
        case_no: 1,
        case_title: '3 case',
        number: 3,
        challengers: [*1..3],
        expected: [[nil], [1, nil], [3, 2]],
      },
      {
        case_no: 2,
        case_title: '4 case',
        number: 4,
        challengers: [*1..4],
        expected: [[nil], [nil, nil], [4, 3, 2, 1]],
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          simple_tournament = SimpleTournament.new c[:number]

          # -- when --
          actual = simple_tournament.apply_challengers c[:challengers]

          # -- then --
          actual = simple_tournament.tournament
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

  context :start_match do
    cases = [
      {
        case_no: 1,
        case_title: '3 case',
        number: 3,
        challengers: [*1..3],
        proc: proc do |one, other, level|
          rets = []
          winner = (one > other ? one : other)
          rets << winner
          rets << level = "level=#{level} #{one} : #{other} 's winner is #{winner}"
          rets
        end,
        expected: [[3], [1, 3], [3, 2]],
      },
      {
        case_no: 2,
        case_title: '4 case',
        number: 4,
        challengers: [*1..4],
        proc: proc do |one, other, level|
          rets = []
          winner = (one > other ? one : other)
          rets << winner
          rets << "level=#{level} #{one} : #{other} 's winner is #{winner}"
          rets
        end,
        expected: [[4], [4, 2], [4, 3, 2, 1]],
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          simple_tournament = SimpleTournament.new c[:number]
          simple_tournament.apply_challengers c[:challengers]

          # -- when --
          simple_tournament.start_match c[:proc]

          # -- then --
          actual = simple_tournament.tournament
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

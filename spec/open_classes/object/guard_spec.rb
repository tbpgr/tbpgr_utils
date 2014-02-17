# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Object do
  context :guard do
    class HogeGuard
      def hoge_guard_return(input)
        guard(input) { return 'guard!!' }
        'not guard return'
      end

      def hoge_guard_fail(input)
        guard(input) { fail ArgumentError, 'error!!' }
        'not guard fail'
      end
    end
    cases = [
      {
        case_no: 1,
        case_title: 'gard return case',
        input: true,
        action: "return 'guard!!'",
        expected: 'guard!!',
      },
      {
        case_no: 2,
        case_title: 'not gard return case',
        input: false,
        action: "return 'guard!!'",
        expected: 'not guard return',
      },
      {
        case_no: 3,
        case_title: 'gard fail case',
        input: true,
        action: "fail ArgumentError, 'error!!'",
        fail: true,
        expect_error: true
      },
      {
        case_no: 4,
        case_title: 'not gard fail case',
        input: false,
        action: "fail ArgumentError, 'error!!'",
        fail: true,
        expected: 'not guard fail',
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          if c[:fail]
            if c[:expect_error]
              # -- when & then --
              lambda { HogeGuard.new.hoge_guard_fail c[:input] }.should raise_error(ArgumentError)
            else
              # -- when --
              actual = HogeGuard.new.hoge_guard_fail c[:input]
              # -- then --
              expect(actual).to eq(c[:expected])
            end
          else
            # -- when --
            actual = HogeGuard.new.hoge_guard_return c[:input]
            # -- then --
            expect(actual).to eq(c[:expected])
          end

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

  context :unless_guard do
    class HogeUnlessGuard
      def hoge_unless_guard_return(input)
        unless_guard(input) { return 'unless_guard!!' }
        'not unless_guard return'
      end

      def hoge_unless_guard_fail(input)
        unless_guard(input) { fail ArgumentError, 'error!!' }
        'not unless_guard fail'
      end
    end
    cases = [
      {
        case_no: 1,
        case_title: 'unless_gard return case',
        input: false,
        action: "return 'unless_guard!!'",
        expected: 'unless_guard!!',
      },
      {
        case_no: 2,
        case_title: 'not unless_gard return case',
        input: true,
        action: "return 'unless_guard!!'",
        expected: 'not unless_guard return',
      },
      {
        case_no: 3,
        case_title: 'unless_gard fail case',
        input: false,
        action: "fail ArgumentError, 'error!!'",
        fail: true,
        expect_error: true
      },
      {
        case_no: 4,
        case_title: 'not unless_gard fail case',
        input: true,
        action: "fail ArgumentError, 'error!!'",
        fail: true,
        expected: 'not unless_guard fail',
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          if c[:fail]
            if c[:expect_error]
              # -- when & then --
              lambda { HogeUnlessGuard.new.hoge_unless_guard_fail c[:input] }.should raise_error(ArgumentError)
            else
              # -- when --
              actual = HogeUnlessGuard.new.hoge_unless_guard_fail c[:input]
              # -- then --
              expect(actual).to eq(c[:expected])
            end
          else
            # -- when --
            actual = HogeUnlessGuard.new.hoge_unless_guard_return c[:input]
            # -- then --
            expect(actual).to eq(c[:expected])
          end

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

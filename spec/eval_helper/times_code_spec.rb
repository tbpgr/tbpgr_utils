# encoding: utf-8
require 'spec_helper'
require 'eval_helper'

describe 'EvalHelper' do
  context :times_code do
    class EvalHelperTimesTest
      include EvalHelper

      def hoge(number, proc)
        code = times_code(number, proc)
      end
    end
    cases = [
      {
        case_no: 1,
        case_title: 'single_line_proc case',
        number: 2,
        proc: 'puts "#{i}times"',
        expected: '2.times { |i| puts "#{i}times" }'
      },
      {
        case_no: 2,
        case_title: 'multi_line_proc case',
        number: 3,
        proc: 'puts "#{i}times"\nputs "#{i*2}times"',
        expected: <<-EOS
3.times do |i|
  puts \"\#{i}times\"
  puts \"\#{i*2}times\"
end
        EOS
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = EvalHelperTimesTest.new.hoge c[:number], c[:proc]

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

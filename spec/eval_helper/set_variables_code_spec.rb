# encoding: utf-8
require 'spec_helper'
require 'eval_helper'

describe 'EvalHelper' do
  context :setting_variables_code do
    class EvalHelperSetVariablesTest
      include EvalHelper

      def hoge(variables)
        setting_variables_code(variables)
      end
    end
    cases = [
      {
        case_no: 1,
        case_title: 'set multi variables case',
        variables: [
          {
            name: 'name1',
            value: '"value1"',
          },
          {
            name: 'name2',
            value: '"value2"',
          },
        ],
        expected: %(name1 = "value1"
name2 = "value2")
      },
      {
        case_no: 2,
        case_title: 'not hash case',
        variables: 'hoge',
        expect_error: true,
      },
      {
        case_no: 3,
        case_title: 'not hash[:name] case',
        variables: [
          {
            not_name: 'name1',
            value: '"value1"',
          },
          {
            not_name: 'name2',
            value: '"value3"',
          },
        ],
        expect_error: true,
      },
      {
        case_no: 4,
        case_title: 'not hash[:value] case',
        variables: [
          {
            name: 'name1',
            not_value: '"value1"',
          },
          {
            name: 'name2',
            not_value: '"value3"',
          },
        ],
        expect_error: true,
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
            lambda { EvalHelperSetVariablesTest.new.hoge c[:variables] }.should raise_error(StandardError)
            next
          end
          actual = EvalHelperSetVariablesTest.new.hoge c[:variables]

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

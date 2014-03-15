# encoding: utf-8
require 'spec_helper'
require 'eval_helper'

describe 'EvalHelper' do
  context :attr_accessor_init_code do
    class EvalHelperAttrAccessorInitTest
      include EvalHelper

      def hoge(args)
        attr_accessor_init_code(args)
      end
    end
    cases = [
      {
        case_no: 1,
        case_title: 'single case',
        input: 'atr1',
        expected: <<-EOS
attr_accessor :atr1

def initialize(atr1)
  @atr1 = atr1
end
        EOS
      },
      {
        case_no: 2,
        case_title: 'multi case',
        input: ['atr1', 'atr2'],
        expected: <<-EOS
attr_accessor :atr1, :atr2

def initialize(atr1, atr2)
  @atr1 = atr1
  @atr2 = atr2
end
        EOS
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          eval_helper = EvalHelperAttrAccessorInitTest.new

          # -- when --
          actual = eval_helper.hoge(c[:input])

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

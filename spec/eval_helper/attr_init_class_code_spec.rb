# encoding: utf-8
require 'spec_helper'
require 'eval_helper'

describe 'EvalHelper' do
  context :attr_init_class_code do
    class EvalHelperAttrInitTest
      include EvalHelper

      def hoge(hash)
        attr_init_class_code(hash[:class_name], hash[:fields])
      end
    end
    cases = [
      {
        case_no: 1,
        case_title: 'unless case',
        class_name: 'Hoge',
        fields: [:hoge1, :hoge2, :hoge3],
        expected: <<-EOS
require 'attributes_initializable'

class Hoge
  include AttributesInitializable
  attr_accessor_init :hoge1, :hoge2, :hoge3
end
        EOS
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          eval_helper = EvalHelperAttrInitTest.new

          # -- when --
          actual = eval_helper.hoge(c)

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

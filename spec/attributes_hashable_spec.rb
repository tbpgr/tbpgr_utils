# encoding: utf-8
require 'spec_helper'
require 'attributes_hashable'
require 'attributes_initializable'

describe AttributesHashable do
  context :to_hash do
    class AttributesHashableHoge
      include AttributesInitializable
      attr_accessor_init :hoge, :hige
      include AttributesHashable
    end

    class NoAttributeHoge
      include AttributesHashable
    end

    cases = [
      {
        case_no: 1,
        case_title: '2 attributes case',
        klass: AttributesHashableHoge,
        expected: { hoge: 'hoge', hige: 'hige' }
      },
      {
        case_no: 2,
        case_title: 'no attribute case',
        klass: NoAttributeHoge,
        expected: {}
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          instance = c[:klass].new do |k|
            k.hoge = 'hoge'
            k.hige = 'hige'
          end

          # -- when --
          actual = instance.to_hash

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

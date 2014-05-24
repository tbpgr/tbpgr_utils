# encoding: utf-8
require 'spec_helper'
require 'attr_enumerable'

describe AttrEnumerable do
  context :each_attr_with_index do
    class EachAttrWithIndexPerson
      attr_reader :name, :age
      def initialize(name, age)
        @name, @age = name, age
      end
    end

    class EachAttrWithIndexPersons
      attr_reader :each_attr_with_index_persons
      include AttrEnumerable
      def initialize(persons = [])
        @each_attr_with_index_persons = persons
      end

      def <<(person)
        @each_attr_with_index_persons << person
      end
    end

    cases = [
      {
        case_no: 1,
        case_title: 'name case',
        klass: EachAttrWithIndexPersons.new(
          [
            EachAttrWithIndexPerson.new('tanaka', 84),
            EachAttrWithIndexPerson.new('suzuki', 103)
          ]
        ),
        method: :each_name_with_index,
        expected: ['tanaka:0', 'suzuki:1']
      },
      {
        case_no: 2,
        case_title: 'age case',
        klass: EachAttrWithIndexPersons.new(
          [
            EachAttrWithIndexPerson.new('tanaka', 84),
            EachAttrWithIndexPerson.new('suzuki', 103)
          ]
        ),
        method: :each_age_with_index,
        expected: ['84:0', '103:1']
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          ret = []
          c[:klass].send c[:method] { |attribute, index| ret << attribute.to_s + ":#{index}" }

          # -- then --
          expect(ret).to eq(c[:expected])
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

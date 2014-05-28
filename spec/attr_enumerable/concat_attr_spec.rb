# encoding: utf-8
require 'spec_helper'
require 'attr_enumerable'

describe AttrEnumerable do
  context :concat_attr do
    class AttrEnumerablePerson
      attr_reader :name, :age
      def initialize(name, age)
        @name, @age = name, age
      end
    end

    class AttrEnumerablePersons
      attr_reader :attr_enumerable_persons
      include AttrEnumerable
      def initialize(attr_enumerable_persons = [])
        @attr_enumerable_persons = attr_enumerable_persons
      end

      def <<(person)
        @attr_enumerable_persons << attr_enumerable_persons
      end
    end

    cases = [
      {
        case_no: 1,
        case_title: 'name case',
        klass: AttrEnumerablePersons.new(
          [
            AttrEnumerablePerson.new('tanaka', 84),
            AttrEnumerablePerson.new(nil, 99),
            AttrEnumerablePerson.new('suzuki', nil)
          ]
        ),
        method: :concat_name,
        add_array: ['sato', 'matsumoto'],
        expected: ['tanaka', nil, 'suzuki', 'sato', 'matsumoto']
      },
      {
        case_no: 2,
        case_title: 'age case',
        klass: AttrEnumerablePersons.new(
          [
            AttrEnumerablePerson.new('tanaka', 84),
            AttrEnumerablePerson.new(nil, 99),
            AttrEnumerablePerson.new('suzuki', nil)
          ]
        ),
        method: :concat_age,
        add_array: [20, 1],
        expected: [84, 99, nil, 20, 1]
      },
      {
        case_no: 3,
        case_title: 'empty case',
        klass: AttrEnumerablePersons.new([]),
        method: :concat_name,
        add_array: ['sato', 'matsumoto'],
        expected: ['sato', 'matsumoto']
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = c[:klass].send c[:method], c[:add_array]

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

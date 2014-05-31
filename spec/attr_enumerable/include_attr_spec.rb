# encoding: utf-8
require 'spec_helper'
require 'attr_enumerable'

describe AttrEnumerable do
  context :include_attr? do
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
            AttrEnumerablePerson.new('tanaka', 20),
            AttrEnumerablePerson.new('suzuki', 20)
          ]
        ),
        method: :include_name?,
        value: 'tanaka',
        expected: true,
      },
      {
        case_no: 2,
        case_title: 'age case',
        klass: AttrEnumerablePersons.new(
          [
            AttrEnumerablePerson.new('tanaka', 84),
            AttrEnumerablePerson.new('tanaka', 20),
            AttrEnumerablePerson.new('suzuki', 20)
          ]
        ),
        method: :include_age?,
        value: 84,
        expected: true,
      },
      {
        case_no: 3,
        case_title: 'name not include case',
        klass: AttrEnumerablePersons.new(
          [
            AttrEnumerablePerson.new('tanaka', 84),
            AttrEnumerablePerson.new('tanaka', 20),
            AttrEnumerablePerson.new('suzuki', 20)
          ]
        ),
        method: :include_name?,
        value: 'sato',
        expected: false,
      },
      {
        case_no: 4,
        case_title: 'empty case',
        klass: AttrEnumerablePersons.new([]),
        method: :include_name?,
        value: 'tanaka',
        expected: false,
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing
          ary = c[:klass]

          # -- when --
          actual = ary.send(c[:method], c[:value])

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

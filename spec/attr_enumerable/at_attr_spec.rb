# encoding: utf-8
require 'spec_helper'
require 'attr_enumerable'

describe AttrEnumerable do
  context :at_attr do
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
            AttrEnumerablePerson.new('suzuki', 103)
          ]
        ),
        method: :at_name,
        args: 0,
        expected: 'tanaka'
      },
      {
        case_no: 2,
        case_title: 'age case',
        klass: AttrEnumerablePersons.new(
          [
            AttrEnumerablePerson.new('tanaka', 84),
            AttrEnumerablePerson.new('suzuki', 103)
          ]
        ),
        method: :at_age,
        args: 1,
        expected: 103
      },
      {
        case_no: 3,
        case_title: 'not exists case',
        klass: AttrEnumerablePersons.new(
          [
            AttrEnumerablePerson.new('tanaka', 84),
            AttrEnumerablePerson.new('suzuki', 103)
          ]
        ),
        method: :at_name,
        args: 2,
        expected: nil
      },
      {
        case_no: 4,
        case_title: 'empty case',
        klass: AttrEnumerablePersons.new([]),
        method: :at_name,
        args: 0,
        expected: nil
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = c[:klass].send c[:method], c[:args]

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

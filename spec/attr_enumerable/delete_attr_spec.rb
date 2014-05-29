# encoding: utf-8
require 'spec_helper'
require 'attr_enumerable'

describe AttrEnumerable do
  context :delete_attr do
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
        method: :delete_name,
        delete: 'tanaka',
        expected_return: ['tanaka', 'tanaka'],
        expected_size: 1
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
        method: :delete_age,
        delete: 20,
        expected_return: [20, 20],
        expected_size: 1
      },
      {
        case_no: 3,
        case_title: 'no delete target case',
        klass: AttrEnumerablePersons.new(
          [
            AttrEnumerablePerson.new('tanaka', 84),
            AttrEnumerablePerson.new('tanaka', 20),
            AttrEnumerablePerson.new('suzuki', 20)
          ]
        ),
        method: :delete_name,
        delete: 'sato',
        expected_return: [],
        expected_size: 3
      },
      {
        case_no: 4,
        case_title: 'empty case',
        klass: AttrEnumerablePersons.new([]),
        method: :delete_name,
        delete: 'tanaka',
        expected_return: [],
        expected_size: 0
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
          actual = ary.send c[:method], c[:delete]
          attribute = c[:method].to_s.gsub('delete_', '').to_sym
          actual = actual.map { |v|v.send(attribute) }

          # -- then --
          expect(actual).to match_array(c[:expected_return])
          expect(ary.attr_enumerable_persons.size).to eq(c[:expected_size])
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

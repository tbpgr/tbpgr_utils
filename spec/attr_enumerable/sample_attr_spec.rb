# encoding: utf-8
require 'spec_helper'
require 'attr_enumerable'

describe AttrEnumerable do
  context :sample_attr do
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
        method: :sample_name,
        count: 2,
        expected_array: ['tanaka', 'suzuki'],
        expected_size: 2,
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
        method: :sample_age,
        count: nil,
        expected_array: [84, 20],
        expected_size: 1,
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing
          ary = c[:klass]

          # -- when --
          actual =
            if c[:count]
              ary.send(c[:method], c[:count])
            else
              ary.send(c[:method])
            end
          actual = Array(actual)

          # -- then --
          expect(actual.size).to eq(c[:expected_size])
          actual.each { |e| expect(c[:expected_array]).to include(e) }
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

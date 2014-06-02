# encoding: utf-8
require 'spec_helper'
require 'attr_enumerable'

describe AttrEnumerable do
  context :map_attr do
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
        method: :map_name,
        block: lambda { |x|x.upcase },
        expected: ['TANAKA' , 'TANAKA', 'SUZUKI'],
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
        method: :map_age,
        block: lambda { |x|x += 1 },
        expected: [85, 21, 21],
      },
      {
        case_no: 3,
        case_title: 'empty case',
        klass: AttrEnumerablePersons.new([]),
        method: :map_name,
        block: lambda { |x|x += 1 },
        expected: [],
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
          actual = ary.send(c[:method]) { |x|c[:block].call(x) }

          # -- then --
          expect(Array(actual)).to match_array(c[:expected])
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

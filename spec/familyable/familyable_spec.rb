# encoding: utf-8
require 'spec_helper'
require 'familyable'

describe Familyable::Family do
  context :get_parents do
    cases = [
      {
        case_no: 1,
        case_title: 'have 2 parents case',
        persons: [
          a = Familyable::Person.new(id: 1, parent_ids: [2, 3]),
          b = Familyable::Person.new(id: 2, parent_ids: []),
          c = Familyable::Person.new(id: 3, parent_ids: [4],),
          d = Familyable::Person.new(id: 4, parent_ids: []),
          e = Familyable::Person.new(id: 5, parent_ids: [2]),
        ],
        index: 0,
        expected: [1, 2]
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          family = Familyable::Family.new(family: c[:persons])

          # -- when --
          actuals = family.get_parents c[:persons][c[:index]]

          # -- then --
          expect(actuals.size).to eq(c[:expected].size)
          actuals.each_with_index do |actual_person, i|
            expect(actual_person).to eq(c[:persons][c[:expected][i]])
          end
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

  context :get_children do
    cases = [
      {
        case_no: 1,
        case_title: 'have 2 children case',
        persons: [
          a = Familyable::Person.new(id: 1, parent_ids: [2, 3]),
          b = Familyable::Person.new(id: 2, parent_ids: []),
          c = Familyable::Person.new(id: 3, parent_ids: [4],),
          d = Familyable::Person.new(id: 4, parent_ids: []),
          e = Familyable::Person.new(id: 5, parent_ids: [2]),
        ],
        index: 1,
        expected: [0, 4]
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          family = Familyable::Family.new(family: c[:persons])

          # -- when --
          actuals = family.get_children c[:persons][c[:index]]

          # -- then --
          expect(actuals.size).to eq(c[:expected].size)
          actuals.each_with_index do |actual_person, i|
            expect(actual_person).to eq(c[:persons][c[:expected][i]])
          end
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

  context :get_brothers do
    cases = [
      {
        case_no: 1,
        case_title: 'have 2 brothers case',
        persons: [
          a = Familyable::Person.new(id: 1, parent_ids: [2, 3]),
          b = Familyable::Person.new(id: 2, parent_ids: []),
          c = Familyable::Person.new(id: 3, parent_ids: [4],),
          d = Familyable::Person.new(id: 4, parent_ids: [3]),
          e = Familyable::Person.new(id: 5, parent_ids: [2]),
        ],
        index: 0,
        expected: [3, 4]
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          family = Familyable::Family.new(family: c[:persons])

          # -- when --
          actuals = family.get_brothers c[:persons][c[:index]]

          # -- then --
          expect(actuals.size).to eq(c[:expected].size)
          actuals.sort.each_with_index do |actual_person, i|
            expect(actual_person).to eq(c[:persons][c[:expected][i]])
          end
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

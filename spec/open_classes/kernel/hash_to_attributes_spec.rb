# encoding: utf-8
require 'spec_helper'
require 'open_classes/kernel'

describe Kernel do
  context :hash_to_attributes do
    class PersonForHashToAttributes
      attr_accessor :name, :age
    end

    cases = [
      {
        case_no: 1,
        case_title: 'valid hash case',
        hash: {
          name: 'hoge',
          age: 33
        },
        expected_name: 'hoge',
        expected_age: 33
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          person = PersonForHashToAttributes.new

          # -- when --
          person.hash_to_attributes c[:hash]

          # -- then --
          expect(person.name).to eq(c[:expected_name])
          expect(person.age).to eq(c[:expected_age])
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

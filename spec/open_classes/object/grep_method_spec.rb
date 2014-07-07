# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Object do
  class GrepMethod
    def self.public_method1; end
    def self.public_method2; end
    def self.public_method11; end
    protected
    def self.protected_method1; end
    def self.protected_method2; end
    def self.protected_method11; end
    private
    def self.private_method1; end
    def self.private_method2; end
    def self.private_method11; end
  end

  context :grep_public_instance_method do
    cases = [
      {
        case_no: 1,
        case_title: 'String case',
        search: 'public_method1',
        all: false,
        expected: [:public_method1]
      },
      {
        case_no: 2,
        case_title: 'Symbol case',
        search: :public_method1,
        all: false,
        expected: [:public_method1]
      },
      {
        case_no: 3,
        case_title: 'Regexp case',
        search: /public_method1/,
        all: false,
        expected: [:public_method1, :public_method11]
      },
      {
        case_no: 4,
        case_title: 'not hit case',
        search: /public_method3/,
        all: false,
        expected: []
      },
      {
        case_no: 5,
        case_title: 'all case',
        search: :__send__,
        all: true,
        expected: [:__send__]
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual_instance = GrepMethod.new.grep_method c[:search], c[:all]
          actual_class = GrepMethod.grep_method c[:search], c[:all]

          # -- then --
          expect(actual_instance).to eq(c[:expected])
          expect(actual_class).to eq(c[:expected])
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

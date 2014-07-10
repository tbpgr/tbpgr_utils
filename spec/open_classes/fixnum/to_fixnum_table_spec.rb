# encoding: utf-8
require 'spec_helper'
require 'open_classes/fixnum/to_fixnum_table'

describe Fixnum do
  context :to_fixnum_table do
    cases = [
      {
        case_no: 1,
        case_title: '1-100 case',
        from: 1,
        to: 100,
        by: 10,
        expected: <<-EOS
| 1| 2| 3| 4| 5| 6| 7| 8| 9| 10|
|11|12|13|14|15|16|17|18|19| 20|
|21|22|23|24|25|26|27|28|29| 30|
|31|32|33|34|35|36|37|38|39| 40|
|41|42|43|44|45|46|47|48|49| 50|
|51|52|53|54|55|56|57|58|59| 60|
|61|62|63|64|65|66|67|68|69| 70|
|71|72|73|74|75|76|77|78|79| 80|
|81|82|83|84|85|86|87|88|89| 90|
|91|92|93|94|95|96|97|98|99|100|
        EOS
      },
      {
        case_no: 2,
        case_title: '1-10, by2 case',
        from: 1,
        to: 10,
        by: 2,
        expected: <<-EOS
|1| 2|
|3| 4|
|5| 6|
|7| 8|
|9|10|
        EOS
      },
      {
        case_no: 3,
        case_title: 'from is not Fixnum case',
        from: '1',
        to: 10,
        by: 2,
        expected: ''
      },
      {
        case_no: 4,
        case_title: 'to is not Fixnum case',
        from: 1,
        to: '10',
        by: 2,
        expected: ''
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = Fixnum.to_fixnum_table(c[:from], c[:to], c[:by])

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

# encoding: utf-8

module EvalHelper
  # create times logic strings, for eval
  #
  # ==== Examples
  #
  # single_line_proc case
  #
  #   class EvalHelperTimesTest
  #     include EvalHelper
  #
  #     def hoge(number, proc)
  #       times_code(number, proc)
  #     end
  #   end
  #
  #   hash = {
  #     number: 2,
  #     proc: 'puts "#{i}times"',
  #   }
  #   EvalHelperTimesTest.new.hoge(hash[:number], hash[:proc])
  #
  # return
  #
  #   2.times { |i| puts "#{i}times" }
  #
  # multi_line_proc case
  #
  #   class EvalHelperTimesTest
  #     include EvalHelper
  #
  #     def hoge(number, proc)
  #       times_code(number, proc)
  #     end
  #   end
  #
  #   hash = {
  #     number: 3,
  #     proc: 'puts "#{i}times"\nputs "#{i*2}times"',
  #   }
  #   EvalHelperTimesTest.new.hoge(hash[:number], hash[:proc])
  #
  # return
  #
  #   3.times do |i|
  #     puts "#{i}times"
  #     puts "#{i*2}times"
  #   end
  #
  def times_code(number, proc)
    return "#{number.to_s}.times { |i| #{proc} }" if proc.count('\n') == 0
    indented = proc.split('\n').reduce([]) { |ret, v|ret << "  #{v}" ;ret}.join("\n")
    <<-EOS
#{number.to_s}.times do |i|
#{indented}
end
    EOS
  end
end

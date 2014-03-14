# encoding: utf-8

module EvalHelper
  # create each with index brace single line code, for eval
  #
  # ==== Examples
  #
  #   class EvalHelperEachWithIndexBraceTest
  #     include EvalHelper
  #
  #     def hoge(hash)
  #       each_with_index_brace_code(hash[:target], hash[:proc])
  #     end
  #   end
  #
  #   hash = {
  #     target: '[:a, :b]',
  #     proc: 'puts "#{i}:#{v}"',
  #   }
  #   EvalHelperEachWithIndexBraceTest.new.hoge(hash) # => return '[:a, :b].each { |v, i|puts "#{i}:#{v}" }'
  #
  def each_with_index_brace_code(target, proc)
    "#{target}.each_with_index { |v, i|#{proc} }"
  end
end

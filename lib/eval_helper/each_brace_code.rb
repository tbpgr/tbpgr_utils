# encoding: utf-8

module EvalHelper
  # create each brace single line code, for eval
  #
  # ==== Examples
  #
  #   class EvalHelperEacjBraceTest
  #     include EvalHelper
  #
  #     def hoge(hash)
  #       each_brace_code(hash[:target], hash[:proc])
  #     end
  #   end
  #
  #   hash = {
  #     target: '[:a, :b]',
  #     proc: 'puts v',
  #   }
  #   EvalHelperEacjBraceTest.new.hoge(hash) # => return '[:a, :b].each { |v|puts v }'
  #
  def each_brace_code(target, proc)
    "#{target}.each { |v|#{proc} }"
  end
end

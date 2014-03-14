# encoding: utf-8

module EvalHelper
  # create each with index do single line code, for eval
  #
  # ==== Examples
  #
  #   class EvalHelperEachWithIndexDoTest
  #     include EvalHelper
  #
  #     def hoge(hash)
  #       each_with_index_do_code(hash[:target], hash[:proc])
  #     end
  #   end
  #
  #   hash = {
  #     target: '[:a, :b]',
  #     proc: "puts \"\#{i}:\#{v}1\"\nputs \"\#{i}:\#{v}2\"\n",
  #   }
  #   EvalHelperEachWithIndexDoTest.new.hoge(hash) # => return "[:a, :b].each_with_index do |v, i|\n  puts \"\#{i}:\#{v}1\"\n  puts \"\#{i}:\#{v}2\"\nend"
  #
  def each_with_index_do_code(target, proc)
    "#{target}.each { |v, i|#{proc} }"
    indented = proc.split("\n").reduce([]) { |ret, v|ret << "  #{v}" ; ret }.join("\n")
    "#{target}.each_with_index do |v, i|\n#{indented}\nend"
  end
end

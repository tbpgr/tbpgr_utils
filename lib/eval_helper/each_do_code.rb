# encoding: utf-8

module EvalHelper
  # create each do code, for eval
  #
  # ==== Examples
  #
  #   class EvalHelperEacjBraceTest
  #     include EvalHelper
  #
  #     def hoge(hash)
  #       each_do_code(hash[:target], hash[:proc])
  #     end
  #   end
  #
  #   hash = {
  #     target: '[:a, :b]',
  #     proc: "puts \"\#{v}1\"\nputs \"\#{v}2\"\n",
  #   }
  #   EvalHelperEacjBraceTest.new.hoge(hash) # => return "[:a, :b].each do |v|\n  puts \"\#{v}1\"\n  puts \"\#{v}2\"\nend"
  #
  def each_do_code(target, proc)
    indented = proc.split("\n").reduce([]) { |a, e|a << "  #{e}"; a }.join("\n")
    "#{target}.each do |v|\n#{indented}\nend"
  end
end

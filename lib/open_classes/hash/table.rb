# encoding: utf-8

# Hash
class Hash
  # get pipe format table string from key + value
  #
  # ==== Examples
  #
  # valid commma case
  #
  #   {
  #     :key_1 => :value1___________________,
  #     :key__2 => :value2,
  #     :key___3 => :value3,
  #   }.table
  #
  # result
  #
  #   |key_1  |value1___________________|
  #   |key__2 |value2                   |
  #   |key___3|value3                   |
  #
  def table
    ret = [keys, values].treduce([]) do |ret, one, other|
      ret << "|#{one}|#{other}|"
      ret
    end
    ret = ret.join("\n") + "\n"
    ret.justify_table
  end
end

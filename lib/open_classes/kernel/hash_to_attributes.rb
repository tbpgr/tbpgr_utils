# encoding: utf-8

# Kernel
module Kernel
  # set attributes from hash
  #
  # === Example
  #
  #   class Person
  #     attr_accessor :name, :age
  #   end
  #
  #   person = Person.new
  #   person.hash_to_attributes({name: 'hoge', age: 33})
  #
  # result
  #
  #   #<PersonForHashToAttributes:0x3957858 @age=33, @not_exists="hoge">
  #
  def hash_to_attributes(hash)
    hash.each { |key, value|instance_variable_set "@#{key}", value }
  end
end

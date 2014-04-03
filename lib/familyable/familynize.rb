# encoding: utf-8

module Familyable
  # Familynize
  #
  # this module require id, parent_ids fileds.
  module Familynize
    def get_parents(person)
      ret = []
      tmp_family = family.dup
      person.parent_ids.each do |parent_id|
        tmp_family.each do |v|
          next unless v.id == parent_id
          ret << v
          tmp_family.delete(v)
        end
      end
      ret
    end

    def get_children(person)
      family.reduce([]) do |ret, v|
        ret << v if v.parent_ids.include?(person.id)
        ret
      end
    end

    def get_brothers(person)
      ret = []
      tmp_family = family.dup
      person.parent_ids.each do |parent_id|
        tmp_family.each do |v|
          next if v == person
          next unless v.parent_ids.include?(parent_id)
          ret << v
          tmp_family.delete(v)
        end
      end
      ret
    end
  end
end

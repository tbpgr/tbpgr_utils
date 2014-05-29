# encoding: utf-8

# AttrEnumerable
module AttrEnumerable
  REQUIRES = Dir.glob("#{File.dirname(__FILE__)}/attr_enumerable/*_attr*.rb").map { |file|File.basename(file, '.rb') }
  REQUIRES.each { |require_lib|require "attr_enumerable/#{require_lib}" }
end

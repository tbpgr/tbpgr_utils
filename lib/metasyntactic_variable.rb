# encoding: utf-8

# MetasyntacticVariable
class MetasyntacticVariable
  # META variables array
  META_VARIABLES = [:foo, :bar, :baz, :qux, :quux, :corge, :grault, :garply, :waldo, :fred, :plugh, :xyzzy, :thud]
  # META variables for classes array
  META_CLASSES = [:Foo, :Bar, :Baz, :Qux, :Quux, :Corge, :Grault, :Garply, :Waldo, :Fred, :Plugh, :Xyzzy, :Thud]

  class << self
    # get META variables array
    def meta_variables
      META_VARIABLES
    end

    # get META variables for class array
    def meta_classes
      META_CLASSES
    end
  end
end

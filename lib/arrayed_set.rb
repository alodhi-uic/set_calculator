# arrayed_set.rb
require_relative 'double_set'

class ArrayedSet < DoubleSet
  attr_accessor :elements
  def initialize
    @elements = []
  end

  def add(value) # Add new element to array
    return if @elements.include?(value) #Check for no duplicate element

    @elements << value
    @elements.sort!
  end

  # Gives the traversal of array and converts it to string csv
  def to_s
    @elements.join(", ")
  end

  def clear # Remove all elements
    @elements = []
  end

  def elements # Returns a duplicate (shallow copy) of the @elements array. Done for encapsulation
    @elements.dup
  end

  def type # Returns the type of the set
    "Arrayed"
  end
end

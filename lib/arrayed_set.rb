# arrayed_set.rb
require_relative 'double_set'

class ArrayedSet < DoubleSet
  attr_accessor :elements
  def initialize
    @elements = []
  end

  def add(value)
    return if @elements.include?(value)

    @elements << value
    @elements.sort!
  end

  def to_s
    @elements.join(", ")
  end

  def clear
    @elements = []
  end

  def elements
    @elements.dup
  end
end

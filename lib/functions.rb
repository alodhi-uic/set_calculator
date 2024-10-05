require_relative 'double_set'
require_relative 'arrayed_set'
require_relative 'branching_set'


def swap(set1, set2)
  # Converting both sets to strings
  tempX = set1.to_s
  tempY = set2.to_s

  # Clearing the contents of both sets
  set1.clear
  set2.clear

  # Re-initialize each set with the other's values
  tempY.split(", ").each { |val| set1.add(val.to_i) }
  tempX.split(", ").each { |val| set2.add(val.to_i) }
end

# Union operation: set_x becomes the union of set_x and set_y
def union(set_x, set_y)
  set_y.elements.each do |element|
    set_x.add(element)
  end
end

# Intersection operation: set_x becomes the intersection of set_x and set_y
def intersection(set_x, set_y)
  common_elements = set_x.elements.select do |element|
    set_y.elements.include?(element)
  end

  # Clear set_x and reinitialize it with common elements
  set_x.clear
  common_elements.each { |element| set_x.add(element) }
end



# frozen_string_literal: true
require_relative 'double_set'
require_relative 'arrayed_set'
require_relative 'branching_set'

def swap(set1, set2)
  # Convert both sets to strings
  tempX = set1.to_s
  tempY = set2.to_s

  # Clear the contents of both sets
  set1.clear
  set2.clear

  # Re-initialize each set with the other's values
  tempY.split(", ").each { |val| set1.add(val.to_i) }
  tempX.split(", ").each { |val| set2.add(val.to_i) }
end

# functions.rb

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

# functions.rb

# Copy operation: copy content of set_x into set_y
def copy(set_x, set_y)
  if set_x.is_a?(BranchingSet)
    set_y.clear # Clear the previous content of Y
    set_y.root = deep_copy_bst(set_x.root)
  elsif set_x.is_a?(ArrayedSet)
    set_y.clear # Clear the previous content of Y
    set_x.elements.each { |element| set_y.add_element(element) }
  end
end

# Helper method to create a deep copy of the BST
def deep_copy_bst(node)
  return nil if node.nil?

  new_node = Node.new(node.value)
  new_node.left = deep_copy_bst(node.left)
  new_node.right = deep_copy_bst(node.right)
  new_node
end




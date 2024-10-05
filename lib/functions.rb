# frozen_string_literal: true
require_relative 'double_set'
require_relative 'arrayed_set'
require_relative 'branching_set'

count = 0;

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
# functions.rb

# Copy operation: copy content of set_x into set_y
# def copy(set_x, set_y)
#   count = 0;
#   if set_x.is_a?(BranchingSet)
#     set_y.clear # Clear the previous content of Y
#     set_y = BranchingSet.new
#     deep_copy_bst_nodeee = deep_copy_bst(set_x.root, count) # For BranchingSet, create a deep copy
#     puts "deep_copy_bst_nodeee: #{deep_copy_bst_nodeee.value}"
#     set_y.root = deep_copy_bst_nodeee
#   elsif set_x.is_a?(ArrayedSet)
#     set_y.clear # Clear the previous content of Y
#     set_x.elements.each { |element| set_y.add(element) } # For ArrayedSet, just copy elements
#   end
# end

# Helper method to create a deep copy of the BST
# def deep_copy_bst(node,count)
#   return nil if node.nil?
#   new_node = Node.new(node.value)
#   new_node.left = deep_copy_bst(node.left,count+1)
#   new_node.right = deep_copy_bst(node.right,count+1)
#   puts "node: #{node.value}, new_node: #{new_node.value}, count: #{count}"
#   new_node
# end

# Helper method to create a deep copy of the BST
# def deep_copy_bst(node)
#   return nil if node.nil? # Base case for recursion
#
#   # Create a new node for the copy
#   new_node = Node.new(node.value)
#   new_node.left = deep_copy_bst(node.left) # Recursively copy the left subtree
#   new_node.right = deep_copy_bst(node.right) # Recursively copy the right subtree
#   new_node
# end

# end

def copy(set_x, set_y)
  set_y.clear # Clear the previous content of Y

  if set_x.is_a?(BranchingSet)
    set_y = BranchingSet.new
    puts "Set Y -> Type: #{set_y.type}"
    tempX = set_x.to_s
    tempX.split(", ").each { |val| set_y.add(val.to_i) }
  elsif set_x.is_a?(ArrayedSet)
    change_type(set_y, "Arrayed")
    set_x.elements.each { |element| set_y.add(element) } # For ArrayedSet, add elements directly
  end
end

def change_type(set, new_type)
  if new_type == 'Arrayed' && set.is_a?(BranchingSet)
    # Create a new ArrayedSet and copy elements from BranchingSet
    new_set = ArrayedSet.new
    set.elements.each { |element| new_set.add_element(element) } # Copy elements
    return new_set # Return the new ArrayedSet
  elsif new_type == 'Branching' && set.is_a?(ArrayedSet)
    # Create a new BranchingSet and copy elements from ArrayedSet
    new_set = BranchingSet.new
    set.elements.each { |element| new_set.add_element(element) } # Copy elements
    return new_set # Return the new BranchingSet
  else
    raise "Invalid conversion from #{set.class} to #{new_type}."
  end
end

require_relative 'double_set'

class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BranchingSet < DoubleSet
  attr_accessor :root # This line is added to create an accessor for @root

  def initialize
    @root = nil # Initialization
  end

  def clear
    @root = nil #Clears the content of Set. Since Ruby is a garbage collected language, we dont have to worry about the objects of tree nodes.
  end

  def add(value)
    @root = insert(@root, value) #Adds a new node by calling insert function described below
  end

  def insert(node, value) #Implements Binary tree
    return Node.new(value) if node.nil?

    if value < node.value
      node.left = insert(node.left, value)
    elsif value > node.value
      node.right = insert(node.right, value)
    end #There is no equal condition to make sure of no duplicate elements
    node
  end


#Gives the inorder traversal of tree and converts it to string csv
  def to_s
    # puts "root: #{@root.value}"
    inorder(@root).join(", ")
  end

#Return all elements if the binary tree : Inorder traversal i.e. Sorted values.
  def elements
    inorder(@root)
  end

  def type # Return the type of the set
    "Branching"
  end

  def inorder(node) # Inorder traversal
    return [] if node.nil?
    inorder(node.left) + [node.value] + inorder(node.right)
  end

end
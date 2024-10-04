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
  attr_accessor :root # Add this line to create an accessor for @root

  def initialize
    @root = nil
  end

  def clear
    @root = nil
  end

  def add(value)
    @root = insert(@root, value)
  end

  def insert(node, value)
    return Node.new(value) if node.nil?

    if value < node.value
      node.left = insert(node.left, value)
    elsif value > node.value
      node.right = insert(node.right, value)
    end
    node
  end

  def to_s
    inorder(@root).join(", ")
  end

  def elements
    inorder(@root)
  end

  private

  def inorder(node)
    return [] if node.nil?
    inorder(node.left) + [node.value] + inorder(node.right)
  end

end
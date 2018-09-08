# There are many ways to implement these methods, feel free to add arguments 
# to methods as you see fit, or to create helper methods.

class BinarySearchTree
  attr_accessor :root
  def initialize(root = nil)
    @root = root
  end

  def insert(value)
    if root.nil?
      @root = BSTNode.new(value)
    elsif value < root.value 
      if root.left
        left = BinarySearchTree.new(root.left)
        left.insert(value)
      else 
        root.left = BSTNode.new(value)
      end
    elsif value >= root.value 
      if root.right
        right = BinarySearchTree.new(root.right)
        right.insert(value)
      else 
        root.right = BSTNode.new(value) 
      end 
    end 
  end

  def find(value, tree_node = @root)
    if tree_node.nil? 
      return nil
    elsif value == tree_node.value 
      return tree_node
    elsif value < tree_node.value 
      left = BinarySearchTree.new(tree_node.left)
      left.find(value)
    elsif value > tree_node.value 
      right = BinarySearchTree.new(tree_node.right)
      right.find(value)
    end 
  end

  def delete(value)
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
  end

  def depth(tree_node = @root)
  end 

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end


  private
  # optional helper methods go here:
end

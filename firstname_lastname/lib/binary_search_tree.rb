# There are many ways to implement these methods, feel free to add arguments 
# to methods as you see fit, or to create helper methods.

class BinarySearchTree
  attr_accessor :root
  def initialize(root = nil)
    @root = root
  end

  def insert(value)
    newNode = BSTNode.new(value)
    if root.nil?
      @root = newNode
    elsif value < root.value 
      if root.left
        left = BinarySearchTree.new(root.left)
        left.insert(value)
      else 
        root.left = newNode 
        newNode.parent = root
      end
    elsif value >= root.value 
      if root.right
        right = BinarySearchTree.new(root.right)
        right.insert(value)
      else 
        root.right = newNode 
        newNode.parent = root   
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
    tree_node = find(value)

    return nil if tree_node.nil? 

    if root == tree_node 
      @root = nil 
      return nil
    end

    # no-children case
    if tree_node.left == nil && tree_node.right == nil 
      if tree_node.parent.left && tree_node.parent.left == tree_node
        tree_node.parent.left = nil 
      else 
        tree_node.parent.right = nil 
      end 
      return tree_node
    end 
    
    # one-child case 
    # child is the left node, 
    if tree_node.left && tree_node.right.nil? 
      if tree_node.parent.left && tree_node.parent.left == tree_node
        tree_node.parent.left = tree_node.left 
      else 
        tree_node.parent.right = tree_node.left 
      end 
    elsif tree_node.right && tree_node.left.nil? 
      if tree_node.parent.left && tree_node.parent.left == tree_node
        tree_node.parent.left = tree_node.right 
      else 
        tree_node.parent.right = tree_node.right 
      end 
    end 

    # two-child case 
    if tree_node.left && tree_node.right 
      max = maximum(tree_node.left) 
      maxval = max.value 
      delete(maxval)
      tree_node.value = maxval
    end 

  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    if tree_node.right.nil? 
      return tree_node 
    else 
      return maximum(tree_node.right) 
    end 
  end

  def depth(tree_node = @root)
    return 0 if tree_node.nil? || (tree_node.left.nil? && tree_node.right.nil?)
    left_depth = depth(tree_node.left)
    right_depth = depth(tree_node.right)
    depth = 1
    left_depth > right_depth ? depth += left_depth : depth += right_depth 
    depth 
  end 

  def is_balanced?(tree_node = @root)
    return true if (depth(tree_node.left) - depth(tree_node.right)).abs <= 0
    false
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end


  private
  # optional helper methods go here:
end
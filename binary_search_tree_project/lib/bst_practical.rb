require 'binary_search_tree'
def kth_largest(tree_node, k)
  arr = reverse_order_traversal(k, tree_node)
  return arr[k - 1]
end

def reverse_order_traversal(k, tree_node = @root, arr = [])
    return arr if tree_node.nil? || arr.length == k
    return [tree_node] if tree_node.left.nil? && tree_node.right.nil?
    arr += reverse_order_traversal(k, tree_node.right) if tree_node.right
    arr += [tree_node]
    arr += reverse_order_traversal(k, tree_node.left) if tree_node.left 
    arr  
end


# def kth_largest(tree_node, k)
#   # $count = 0 
#   $kNode = nil
#   node = reverse_order_traversal(k, 0, tree_node)
#   # $kNode
#   node
# end

# def reverse_order_traversal(k, count, tree_node)
#     puts tree_node.value
#     # return tree_node if $count == k

#     # return tree_node if tree_node.nil? 
#     # return [tree_node] if tree_node.left.nil? && tree_node.right.nil?
#     # $count += 1 if tree_node.left.nil? && tree_node.right.nil?
#     # return tree_node if $count == k
#     reverse_order_traversal(k, count, tree_node.right) if tree_node.right
#     # arr += [tree_node]
#     count += 1 unless count >= k
#     return tree_node if count == k
#     # $kNode = tree_node if $count == k

#     reverse_order_traversal(k, count, tree_node.left) if tree_node.left 
#     puts "count = #{count}"
#     return nil
#     # return tree_node if $count == k
# end
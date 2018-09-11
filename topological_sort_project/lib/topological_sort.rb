require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  queue = [] 
  list = []
  vertices.each do |vertex| 
    queue.push(vertex) if vertex.in_edges.length == 0 
  end 
  while queue.length > 0 
    u = queue.shift     
    list.push(u) unless list.include?(u)
    u.out_edges.each do |edge| 
      edge.to_vertex.in_edges.delete(edge)
    end 
    vertices.delete(u) 
    vertices.each do |vertex| 
      queue.push(vertex) if vertex.in_edges.length == 0 
    end 
  end 
  vertices.empty? ? list : []
end


# def topological_sort(vertices)
#   list = [] 
#   stack = []
#   until vertices.empty? 
    
# end 

# def visit(vertex, list, stack)
#   if vertex.out_edges.empty? 
#     list.unshift(vertex)
#     stack.pop()
#   else 
#     stack.push(vertex)
#     vertex.out_edges.each do |vertex| 
#       visit(vertex, list, stack) 
#     end 
#   end 
# end
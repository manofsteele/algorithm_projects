require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

# def topological_sort(vertices)
#   queue = [] 
#   list = []
#   vertices.each do |vertex| 
#     queue.push(vertex) if vertex.in_edges.length == 0 
#   end 
#   while queue.length > 0 
#     u = queue.shift     
#     list.push(u) unless list.include?(u)
#     u.out_edges.each do |edge| 
#       edge.to_vertex.in_edges.delete(edge)
#     end 
#     vertices.delete(u) 
#     vertices.each do |vertex| 
#       queue.push(vertex) if vertex.in_edges.length == 0 
#     end 
#   end 
#   vertices.empty? ? list : []
# end

# First attempt at Tarjan's algorithm 

# def topological_sort(vertices)
#   list = [] 
#   stack = []
#   vertices.each do |vertex| 
#       visit(vertex, list, stack) 
#     end 

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


# Tarjan's algorithm, from review 

def topological_sort(vertices)
  sorted = [] 
  explored = Set.new 
  this_stack = Set.new
  cycle = false 
  vertices.each do |vertex| 
    cycle =  dfs(vertex, explored, sorted, this_stack) if !explored.include?(vertex)
    return [] if cycle
  end 
  sorted 
end 

def dfs(vertex, explored, sorted, this_stack, cycle) 
  return true if this_stack.include?(vertex)
  explored.add(vertex)
  this_stack.add(vertex)

  vertex.out_edges.each do |edge| 
    new_vertex = edge.to_vertex 
    if !explored.include?(new_vertex)
      cycle = dfs(new_vertex, explored, sorted, this_stack, cycle)
    end 
    return true if cycle
  end 
  this_stack.delete(vertex)
  sorted.unshift(vertex)
  false
end 
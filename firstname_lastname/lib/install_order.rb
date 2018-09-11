# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to
require_relative 'topological_sort'



def install_order(arr)
  leaves = [] 
  vertices = {}
  max = 0

  arr.each do |tuple| 
    vertex = Vertex.new(tuple[0])
    vertices[tuple[0]] = vertex
    max = tuple[0] if tuple[0] > max 
    max = tuple[1] if tuple[1] > max
  end 

  arr.each do |tuple| 
    if vertices[tuple[1]]
      to_vertex = vertices[tuple[1]]
      from_vertex = vertices[tuple[0]] 
      edge = Edge.new(from_vertex, to_vertex)
      vertices[tuple[0]].out_edges.push(edge)
      vertices[tuple[1]].in_edges.push(edge)
    else 
      leaves << Vertex.new(tuple[1]) 
    end
  end 
  result = topological_sort(vertices.values) + leaves
  result = result.map { |vertex| vertex.value}
  no_dependencies = (1..max).select { |val| !result.include?(val) }
  result += no_dependencies
  result.reverse
end

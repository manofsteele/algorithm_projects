require_relative "heap"

class Array
  def heap_sort!
    BinaryMinHeap.heapify_down(self, 0)
    p self
    (0...self.length - 2).each do |idx| 
      rest_of_array = BinaryMinHeap.heapify_down(self[idx + 1..-1], 0)
      p rest_of_array
      (0...rest_of_array.length).each do |idx2| 
        self[idx + 1 + idx2] = rest_of_array[idx2] 
      end
      # self = self[0] + BinaryMinHeap.heapify_down(self[idx], idx)
      p self
    end

  end
end

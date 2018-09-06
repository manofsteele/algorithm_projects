class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = [] 
    @prc ||= {}
  end

  def count
  end

  def extract
  end

  def peek
  end

  def push(val)
  end

  public
  def self.child_indices(len, parent_index)
    idx1 = parent_index * 2 + 1 
    idx2 = parent_index * 2 + 2 
    result = []
    result.push(idx1) if idx1 < len 
    result.push(idx2) if idx2 < len 
    result
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    return (child_index -1)/2 if child_index.even? 
    return (child_index/2) if child_index.odd?
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    self.child_indices(len, parent_idx).each do |idx| 
      until array[parent_idx] >= array[idx]
        if array[idx] < array[parent_idx] 
          array[idx], array[parent_idx] = array[parent_idx], array[idx]
          parent_idx = idx 
        end 
      end
    end 
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
  end
end

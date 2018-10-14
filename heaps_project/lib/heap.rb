class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = [] 
    prc ||= Proc.new {|a, b| a <=> b}
    @prc = prc
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

  # do something with the proc to make it test for difference... 
  # compare differences between two child nodes 

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new {|a, b| a <=> b}
    
    child_indices = child_indices(len, parent_idx) 
    return if child_indices.length == 0 

    child_idx1, child_idx2 = child_indices
    
    diff1 = prc.call(array[parent_idx], array[child_idx1])
    if child_idx2 
      diff2 = prc.call(array[parent_idx], array[child_idx2])
    else 
      diff2 = 0 
    end
    if child_idx2
      diff_children = prc.call(array[child_idx1], array[child_idx2])
    else 
      diff_children = 0 
    end 

    changed = false
    if diff1 > 0 && diff2 > 0 
      if diff_children < 0 
        array[parent_idx], array[child_idx1] = array[child_idx1], array[parent_idx] 
      else 
        array[parent_idx], array[child_idx2] = array[child_idx2], array[parent_idx] 
      end 
      changed = true
    elsif diff1 > 0 
    # if diff1 > 0
      array[parent_idx], array[child_idx1] = array[child_idx1], array[parent_idx] 
      changed = true
    elsif diff2 > 0
      array[parent_idx], array[child_idx2] = array[child_idx2], array[parent_idx] 
      changed = true
    else 
      changed = false
    end 
    
    # if changed
    #   BinaryMinHeap.heapify_down(array, parent_idx)
    # else
    #   self.heapify_down(array, parent_idx + 1)
    # end
    BinaryMinHeap.heapify_down(array, child_idx1, &prc)
    if child_idx2
      BinaryMinHeap.heapify_down(array, child_idx2, &prc)
    end
    # end
    
    array

    # children = []
    # child_indices[len, parent_idx].each do |idx|
    #   children << array[idx] if array[idx] 
    # end
      
    #   child_indices(len, parent_idx).each do |idx| 
    #   if prc.call(array[idx], array[parent_idx]) <= 0 
    #     array[idx], array[parent_idx] = array[parent_idx], array[idx]
    #     parent_idx = idx 
    #   end 
    # end
    # self.heapify_down(array, parent_idx, len, &prc)

    # array 
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
  end
end

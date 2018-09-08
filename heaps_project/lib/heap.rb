class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = [] 
    prc ||= Proc.new {|a, b| a <=> b}
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
    BinaryMinHeap.child_indices(len, parent_idx).each do |idx, prc| 
      until prc.call(array[parent_idx], array[idx]) >= 0
        if prc.call(array[idx], array[parent_idx]) < 0 
          array[idx], array[parent_idx] = array[parent_idx], array[idx]
          parent_idx = idx 
        end 
      end
    end
    array 
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
  end
end

class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length < 2
    pivot = array[0]
    left, right = [], []
    array.each do |el|
      if el <= pivot 
        left << el 
      else 
        right << el 
      end 
    end 
    sort1(left) + pivot + sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    return array if length < 2
    pivot_index = QuickSort.partition(array, start, length, &prc)
    left_length = pivot_index - start
    right_length = length - left_length - 1
    QuickSort.sort2!(array, start, left_length, &prc)
    QuickSort.sort2!(array, pivot_index + 1, right_length, &prc)
    array
  end

  def self.partition(array, start, length, &prc)
    # return start + length if length < 2
    prc ||= Proc.new {|a, b| a <=> b}
    pivot_index = start
    ((start + 1)..start + length - 1).each do |idx| 

      if prc.call(array[start], array[idx]) > 0 
        array[idx], array[pivot_index + 1] = array[pivot_index + 1], array[idx] 
        pivot_index += 1 
      end 
    end 

    array[start], array[pivot_index] = array[pivot_index], array[start]
    
    return pivot_index 
  end
end

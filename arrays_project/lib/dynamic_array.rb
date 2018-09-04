require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @store = StaticArray.new(8)
    @length = 0;
    @capacity = 8;
  end

  # O(1)
  def [](index)
    raise "index out of bounds" if index >= @length
    @store[index]
  end

  # O(1)
  def []=(index, value)
    raise "index out of bounds" if index >= @length
    @store[index] = value
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length == 0
    val = @store[@length - 1]
    @store[@length - 1] = nil 
    @length -= 1
    val 
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    @length += 1
    if @length > @capacity 
      self.resize! 
    end 
    @store[@length - 1] = val
  end

  # O(n): has to shift over all the elements.
  def shift
    raise "index out of bounds" if @length == 0
    val = @store[0]
    if @length >= 2 
      (1..@length - 1).each do |idx| 
        @store[idx - 1] = @store[idx] 
      end
      @store[@length - 1] = nil 
    end  
    @length -= 1
    val
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    @length += 1 
    self.resize! if @length > @capacity 
    @length.downto(1) do |idx| 
      @store[idx] = @store[idx - 1] 
    end 
    @store[0] = val
    @store
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    @capacity *= 2
    new_array = StaticArray.new(@capacity)
    (0...@length).each do |idx|
      new_array[idx] = @store[idx]
    end 
    @store = new_array 
  end
end

require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @store = StaticArray.new(8)
    @length = 0
    @capacity = 8
    @start_idx = 0
  end

  # O(1)
  def [](index)
    raise "index out of bounds" if index >= @length || @length == 0
    @store[(@start_idx + index) % @capacity]
  end

  # O(1)
  def []=(index, val)
    @store[(@start_idx + index) % capacity] = val
  end

  # O(1)
  def pop
    raise "index out of bounds" if length == 0
    val = @store[(@start_idx + @length - 1) % @capacity]
    @store[(@start_idx + @length - 1) % @capacity] = nil 
    @length -= 1
    val
  end

  # O(1) ammortized
  def push(val)
    @length += 1 
    if @length > @capacity 
      self.resize! 
    end 
    @store[(@start_idx + @length - 1) % @capacity] = val
  end

  # O(1)
  def shift
    raise "index out of bounds" if @length == 0
    val = @store[@start_idx] 
    @store[@start_idx] = nil 
    @start_idx = (@start_idx + 1) % @capacity
    @length -= 1
    val
  end

  # O(1) ammortized
  def unshift(val)
    @length += 1 
    self.resize! if @length > @capacity 
    @store[(@start_idx - 1) % capacity] = val 
    @start_idx -= 1
    @store
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
  end

  def resize!
    new_store = StaticArray.new(@capacity * 2)
    (0..@capacity).each do |index| 
      new_store[index] = @store[(@start_idx + index) % @capacity] 
    end 
    @store = new_store
    @capacity *= 2 
    @start_idx = 0
  end
end

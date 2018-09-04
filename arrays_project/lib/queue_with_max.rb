# Implement a queue with #enqueue and #dequeue, as well as a #max API,
# a method which returns the maximum element still in the queue. This
# is trivial to do by spending O(n) time upon dequeuing.
# Can you do it in O(1) amortized? Maybe use an auxiliary storage structure?

# Use your RingBuffer to achieve optimal shifts! Write any additional
# methods you need.

require_relative 'ring_buffer'

class QueueWithMax
  attr_accessor :store
  attr_accessor :max

  def initialize
    @store = RingBuffer.new
    @max = nil
    @maxes = RingBuffer.new
  end

  def enqueue(val)
    if length == 0 
      @max = val 
    elsif val > @max
      @max = val 
    end 
    @store.push(val)
    @maxes.push(max)
  end

  def dequeue
    # p @store 
    # p @maxes
    val = @store.shift
    # @maxes.pop
    # if @maxes.length > 0
    #   @max = @maxes[length - 1]
    # else 
    #   @max = nil 
    # end 
    # if max == val 
    #   @max = @store[0]
    # end 

    # The below is O(n)
    if val == max && length > 0
      @max = @store[0]
      if length > 1
        (1...length).each do |index| 
          if @store[index] > @max 
            @max = @store[index] 
          end 
        end 
      end
    end 
  end

  def max
    @max
  end

  def length
    @store.length
  end

end

require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  attr_reader :count
  include Enumerable

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    @count += 1 unless include?(key)
    resize! if @count > num_buckets
    if include?(key)
      bucket(key).update(key, val)
    else
      bucket(key).append(key, val)
    end
  end

  def get(key)
    if include?(key)
      bucket(key).get(key)
    end 
  end

  def delete(key)
    # if include?(key)
      bucket(key).remove(key)
      @count -= 1
    # end
  end

  def each(&prc)
    @store.each do |bucket, &prc| 
      bucket.each(&prc) 
    end
  end

  def [](key) 
    get(key)
  end 

  def []=(key, val) 
    set(key, val)
  end 
  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @store = Array.new(num_buckets * 2) {LinkedList.new}
    old_store.each do |bucket| 
      bucket.each do |key, val| 
        set(key, val)
      end 
    end 
  end

  def bucket(key)
    @store[key.hash % num_buckets]
    # optional but useful; return the bucket corresponding to `key`
  end
end
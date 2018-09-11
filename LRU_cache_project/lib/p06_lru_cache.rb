require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    val = @map.get(key)
    if val
      update_node!(@store[key])  
    else
      val = @prc.call(key) 
      @store.append(key, val)
      @map.set(key, val)
      eject! if @map.count > @max 
    end
    puts val
    val
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
  end

  def update_node!(node)
    @store.remove(node.key) 
    @store.append(node)
    # suggested helper method; move a node to the end of the list
  end

  def eject!
    key = @store.first
    @store.remove(key) 
    @map.delete(key)
  end
end

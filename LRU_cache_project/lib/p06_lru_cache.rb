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
    p @store.map { |l| l.key}
    p key
    val = @map.get(key)
    # p @map
    if val
      node = map[key]
      update_node!(node)  
    else
      p "proc being called"
      val = @prc.call(key) 
      @store.append(key, val)
      @map.set(key, val)
      eject! if count > @max 
    end
    # p @store.map { |l| l.key}
    # puts val
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
    @store.append(node.key, node.val)
    @map.set(node.key, node.val)
    @map[node.key] = node 
    # suggested helper method; move a node to the end of the list
  end

  def eject!
    # p @store.map { |l| l.key}
    node = @store.first
    @store.remove(node.key) 
    @map.delete(node.key)
    nil
  end
end

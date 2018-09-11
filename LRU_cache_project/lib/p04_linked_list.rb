class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous node to next node
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable

  def initialize 
    @head = Node.new()
    @tail = Node.new()
    @head.next = @tail 
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    self.each do |node|
      if node.key == key 
        return node.val 
      end 
    end
  end

  def include?(key)
    self.each do |node| 
      return true if node.key == key 
    end 
    false
  end

  def append(key, val)
    newNode = Node.new(key, val)
    newNode.prev = last
    last.next = newNode 
    newNode.next = @tail 
    @tail.prev = newNode 
  end

  def update(key, val)
    self.each do |node| 
      node.val = val if node.key == key 
    end 
  end

  def remove(key)
    self.each do |node| 
      if node.key == key 
        prev_node = node.prev 
        prev_node.next = node.next 
        node.next.prev = prev_node 
      end 
    end 
  end

  def each(&prc)
    current_node = first 
    until current_node == @tail 
      yield current_node 
      current_node = current_node.next 
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  end
end

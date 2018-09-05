class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    result = 0
    self.each_with_index do |el, idx|
      result += el.hash * idx.hash 
    end 
    result
  end
end

class String
  def hash
    ords = self.chars.map { |el| el.ord}
    ords.hash  
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    result = 0 
    self.each do |key, val| 
      result += key.hash * val.hash
    end 
    result
  end
end

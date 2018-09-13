class DynamicProgramming

  def initialize
    @blair_cache = {1 => 1, 2 => 2}
    
    @frog_cache = {
      # 1 => [ [1] ],
      # 2 => [ [1, 1], [2] ],
      # 3 => [ [1, 1, 1], [2, 1], [1, 2], [3] ]
    }

    @super_cache = {

    }
  end

  def blair_nums(n)
    return @blair_cache[n] if @blair_cache[n]
    blair1 = blair_nums(n - 1) 
    blair2 = blair_nums(n - 2)
    nth_odd = (n - 2) * 2 + 1
    @blair_cache[n] = blair1 + blair2 + nth_odd
  end

  def frog_hops_bottom_up(n)
    return frog_cache_builder(n)
  end

  def frog_cache_builder(n)
    frog_cache = {
      1 => [ [1] ],
      2 => [ [1, 1], [2] ],
      3 => [ [1, 1, 1], [2, 1], [1, 2], [3] ]
    }
    return frog_cache[n] if frog_cache[n]
    (4..n).each do |num|
      cache = []
      (1..3).each do |i|
        frog_cache[num - i].each do |arr| 
          cache << arr + [i] 
          cache << [i] + arr 
        end 
      end
      frog_cache[num] = cache.uniq
    end 
    return frog_cache[n]
  end

  def frog_hops_top_down(n)
    frog_hops_top_down_helper(n)
  end

  def frog_hops_top_down_helper(n)
    return @frog_cache[n] if @frog_cache[n]
    frog_hops_top_down_helper(n - 1) if n > 1  
    if n == 1 
      @frog_cache[1] = [ [1] ]
    elsif n == 2 
      @frog_cache[2] =  [ [1, 1], [2] ]
    elsif n == 3
      @frog_cache[3] =  [ [1, 1, 1], [2, 1], [1, 2], [3] ]
    end
    if n > 3
      cache = []
      (1..3).each do |i|
        @frog_cache[n - i].each do |arr| 
          cache << arr + [i] 
          cache << [i] + arr 
        end 
      end
      @frog_cache[n] = cache.uniq 
    end 
    @frog_cache[n]
  end

  def super_frog_hops(n, k)
    super_cache_builder(n, k)
  end

  def super_cache_builder(n, k)
    return super_cache_builder(n, n) if n < k
    super_cache_builder(n - 1, k) if n > 1  
    if n == 1 
      @super_cache[1] = [ [1] ] 
      return @super_cache[1]
    end
    if n > k
      cache = []
      (1..k).each do |i|
        @super_cache[n - i].each do |arr| 
          cache << arr + [i] 
          cache << [i] + arr 
        end 
      end   
      @super_cache[n] = cache.uniq 
    elsif n == k 
      cache = [] 
      @super_cache[n - 1].each do |arr| 
        cache << arr + [1]
        cache << [1] + arr 
      end 
      if n > 2 
        @super_cache[n - 2].each do |arr| 
          cache << arr + [2]
          cache << [2] + arr 
        end
      end
      cache << [n]
      @super_cache[n] = cache.uniq
    end  
    @super_cache[n]
  end 

  def knapsack(weights, values, capacity)

  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)
  end
end

instance = DynamicProgramming.new()

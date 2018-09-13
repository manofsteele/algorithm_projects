class DynamicProgramming

  def initialize
    @blair_cache = {1 => 1, 2 => 2}
    
    @frog_cache = {
      1 => [ [1] ],
      2 => [ [1, 1], [2] ],
      3 => [ [1, 1, 1], [2, 1], [1, 2], [3] ]
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
    # return @frog_cache[n] if @frog_cache[n]
    frog_hops_top_down_helper(n)
    
  end

  def frog_hops_top_down_helper(n)
    if n == 1 
      @frog_cache[1] = [ [1] ]
    elsif 
      n == 2 
      @frog_cache[2] =  [ [1, 1], [2] ]
    elsif n == 3
      @frog_cache[3] =  [ [1, 1, 1], [2, 1], [1, 2], [3] ]
    elsif @frog_cache[n - 1].nil? && n > 3
      @frog_cache[n - 1] = frog_hops_top_down_helper(n - 1)
    end
    
      cache = []
        (1..3).each do |i|
          @frog_cache[n - i].each do |arr| 
            cache << arr + [i] 
            cache << [i] + arr 
          end 
        end
      @frog_cache[n] = cache.uniq
    
    @frog_cache[n]
  end

  def super_frog_hops(n, k)

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

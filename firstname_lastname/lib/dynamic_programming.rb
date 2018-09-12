class DynamicProgramming

  def initialize
    @blair_cache = {1 => 1, 2 => 2}
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
 
  end

  def frog_hops_top_down_helper(n)

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

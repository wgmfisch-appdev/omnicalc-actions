class StatsController < ApplicationController
  def stats
    @numbers = params.fetch("list_of_numbers").gsub(",", "").split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort

    @count = @numbers.count

    @minimum = @numbers.min

    @maximum = @numbers.max

    @range = @numbers.max - @numbers.min

    # Median
    # ======
  sorted_numbers = @numbers.sort
  median_array = []
  if sorted_numbers.count.odd?
    index = sorted_numbers.count/2
    median = sorted_numbers.at(index.to_i)
  else
    index = sorted_numbers.count/2 + 0.5
    median_array[0] = sorted_numbers.at(index.to_i)
    median_array[1] = sorted_numbers.at(index.to_i-1)
    median = median_array.sum / 2
  end
    @median = median

    @sum = @numbers.sum
    
    @mean = @numbers.sum.to_f / @numbers.count

    # Variance
    # ========
    mean = @numbers.sum.to_f / @numbers.count
    var = 0
    @numbers.each do |num|
      var = var + (num-mean)**2
    end
    @variance = var/@numbers.count

    
    @standard_deviation = (var/@numbers.count)**(0.5)

    # Mode
    # ====
    count_array = Array.new(@numbers.count, 1)
    mod = 0
    @numbers.sort.each_with_index do |num, i|
      if num == @numbers.sort.at(i + 1) #this only works if teh mode occurs only twice and none others do
        count_array[i] = count_array[i] + 1
      end
      if count_array[i] == count_array.max
        mod = num
      end
    end
    @mode = mod

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("stats_templates/stats.html.erb")
  end

  def stats_form
    render("stats_templates/stats_form.html.erb")
  end
  
end

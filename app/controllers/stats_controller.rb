class StatsController < ApplicationController
  def stats
    @numbers = params.fetch("list_of_numbers").gsub(",", "").split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = "Replace this string with your answer"

    @count = "Replace this string with your answer"

    @minimum = "Replace this string with your answer"

    @maximum = "Replace this string with your answer"

    @range = "Replace this string with your answer"

    # Median
    # ======

    @median = "Replace this string with your answer"

    @sum = "Replace this string with your answer"

    @mean = "Replace this string with your answer"

    # Variance
    # ========

    @variance = "Replace this string with your answer"

    @standard_deviation = "Replace this string with your answer"

    # Mode
    # ====

    @mode = "Replace this string with your answer"

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("stats_templates/stats.html.erb")
  end
end

class TimeBetweenController < ApplicationController
  def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================

    @seconds = "Replace this string with your answer"
    @minutes = "Replace this string with your answer"
    @hours = "Replace this string with your answer"
    @days = "Replace this string with your answer"
    @weeks = "Replace this string with your answer"
    @years = "Replace this string with your answer"

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("time_between/time_between.html.erb")
  end
end

class LoanPaymentController < ApplicationController
  def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================

    @monthly_payment = "Replace this string with your answer"

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("loan_payment/loan_payment.html.erb")
  end
end

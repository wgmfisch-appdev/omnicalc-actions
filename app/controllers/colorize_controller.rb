class ColorizeController < ApplicationController
  def colorize
    input = {
      image: params[:image_url]
    }

    # ================================================================================
    # Your code goes below.
    # ================================================================================

    @original_image_url = params[:image_url]
    @colorized_image_url = "Replace this string with your answer"

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("colorize.html.erb")
  end
end

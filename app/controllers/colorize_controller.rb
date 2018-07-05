class ColorizeController < ApplicationController
  def colorize
    input = {
      image: params.fetch("image_url")
    }

    # ================================================================================
    # Your code goes below.
    # ================================================================================

    @original_image_url = params.fetch("image_url")
    @colorized_image_url = "Replace this string with your answer"

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("colorize/colorize.html.erb")
  end
end

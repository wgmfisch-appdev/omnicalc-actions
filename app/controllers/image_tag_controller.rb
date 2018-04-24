class ImageTagController < ApplicationController
  def image_tag
    input = {
      image: params[:image_url]
    }

    # ================================================================================
    # Your code goes below.
    # ================================================================================

    @original_image_url = params[:image_url]
    @tag_hashes = "Replace this string with your answer"

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("image_tag/image_tag.html.erb")
  end
end

class TextTagController < ApplicationController
  def text_tag
    @text = params[:text]

    # ================================================================================
    # Your code goes below.
    # ================================================================================

    @tags = "Replace this string with your answer"

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("text_tag/text_tag.html.erb")
  end
end

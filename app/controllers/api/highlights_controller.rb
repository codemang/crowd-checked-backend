class Api::HighlightsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    highlight = Highlight.create!(body: params[:highlightedText], url: params[:url])
    Comment.create!(highlight: highlight, comment: params[:comment])
    render json: {test: true}
  end
end

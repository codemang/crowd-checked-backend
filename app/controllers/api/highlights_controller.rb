class Api::HighlightsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    response = Highlight.includes(:comments).where("url LIKE '%#{params[:url]}%'").each_with_object({}) do |highlight, memo|
      memo[:highlights] ||= []
      memo[:highlights] << {
        body: highlight.body,
        id: highlight.id,
        comments: highlight.comments
      }
    end

    render json: {response: response}
  end

  def create
    # TOOD: Fix highlightedId vs highlightId
    highlight_id = params[:highlightedId]
    if !highlight_id
      highlight = Highlight.create!(body: params[:highlightedText], url: params[:url])
      highlight_id = highlight.id
    end
    Comment.create!(highlight_id: highlight_id, comment: params[:comment])
    render json: {highlight: highlight}
  end
end

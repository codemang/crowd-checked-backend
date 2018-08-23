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
    highlight = Highlight.create!(body: params[:highlightedText], url: params[:url])
    Comment.create!(highlight: highlight, comment: params[:comment])
    render json: {highlight: highlight}
  end
end

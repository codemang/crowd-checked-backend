class Api::HighlightsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_extension_user

  def index
    response = Highlight.includes(:comments).where("url LIKE '%#{params[:url]}%'").each_with_object({}) do |highlight, memo|
      memo[:highlights] ||= []
      memo[:highlights] << json_highlight(highlight)
    end

    render json: {response: response}
  end

  def create
    highlighted_data = params[:highlightedData]
    comment_data = params[:commentData]

    highlight_id = highlighted_data[:highlightId]
    if !highlight_id
      highlight = Highlight.create!(
        body: highlighted_data[:highlightedText],
        url: params[:url],
        article_title: params[:articleTitle],
        user_id: current_extension_user.id
      )
      highlight_id = highlight.id
    end

    comment = Comment.create!(
      highlight_id: highlight_id,
      content: comment_data[:content],
      user_id: current_extension_user.id,
      parent: comment_data[:parent]
    )
    render json: {comment: json_comment(comment)}
  end

  private

  def json_highlight(highlight)
    comments = highlight.comments.each_with_object([]) do |comment, memo|
      memo << json_comment(comment)
    end
    {
      body: highlight.body,
      id: highlight.id,
      comments: comments
    }
  end

  def json_comment(comment)
    {
      id: comment.id,
      created: comment.created_at,
      content: comment.content,
      fullname: comment.user.email.match(/(^.*?)\@/)[1],
      parent: comment.parent,
      upvote_count: 2,
    }
  end
end

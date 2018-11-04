class Api::CommentVotesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :require_authenticate_extension_user

  def create
    comment_vote = CommentVote.find_by(user_id: current_extension_user.id, comment_id: params[:comment_id])
    if comment_vote
      comment_vote.destroy!
    else
      CommentVote.create!(user_id: current_extension_user.id, comment_id: params[:comment_id])
    end
    comment = Comment.find(params[:comment_id])
    render json: {comment: json_comment(comment)}
  end

  private

  def json_comment(comment)
    {
      id: comment.id,
      created: comment.created_at,
      content: comment.content,
      fullname: comment.user.email.match(/(^.*?)\@/)[1],
      parent: comment.parent,
      upvote_count: comment.comment_votes.count,
      userHasUpvoted: comment.comment_votes.where(user_id: current_extension_user.id).present?,
    }
  end
end

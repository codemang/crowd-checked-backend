class NotificationMailer < ApplicationMailer

  default from: 'CrowdChecked Alert <notifications@crowdchecked.com>'

  def mail_for_comment(comment_id)
    @comment = Comment.find(comment_id)
    mail to: @comment.user.email, subject: 'Someone replied to your comment!'
  end
end

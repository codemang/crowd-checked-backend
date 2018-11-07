class NotificationWorker
  include Sidekiq::Worker

  sidekiq_options retry: 2

  def perform(comment_id)
    parent_comment_id = Comment.find(comment_id).parent
    if parent_comment_id
      NotificationMailer.mail_for_comment(parent_comment_id).deliver_now!
    end
  end
end

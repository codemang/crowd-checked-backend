class NotificationMailer < ApplicationMailer

  default from: 'Kaijo Notifications <notifications@mail.kaijo.io>'

  def response_notification(user_id)
    mail to: User.find(user_id).email, subject: 'Incident notification'
  end
end

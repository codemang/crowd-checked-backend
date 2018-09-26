class NotificationMailer < ApplicationMailer

  default from: 'postmaster@sandbox643a867752594d629f5d64aede0d5416.mailgun.org'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.response_notification.subject
  #
  def response_notification
    @greeting = "Hi"

    mail to: "nateboop@gmail.com", subject: 'Nate testing'
  end
end

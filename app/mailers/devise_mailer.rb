class DeviseMailer < Devise::Mailer
  default from: 'postmaster@sandbox643a867752594d629f5d64aede0d5416.mailgun.org'
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'devise/mailer' # to make sure that your mailer uses the devise views
end

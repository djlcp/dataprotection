class MessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.contact_us.subject
  #
  def contact_us(message)
  	@full_name = message.full_name
    @email = message.email
  	@body = message.body
    @time_sent = DateTime.now.strftime("at %H:%M on %d %B %Y")

    mail to: "djgdpr@gmail.com", subject: "Contact Form: #{message.subject_line}"
  end
end

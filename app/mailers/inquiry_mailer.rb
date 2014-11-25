class InquiryMailer < ActionMailer::Base

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.inquiry_mailer.send_mail.subject
  #
  def send_mail(inquiry)
    @inquiry = inquiry
    mail(from: @inquiry.email, to: "mamamamani43@gmail.com", cc: "kaito.titech@gmail.com", subject: 'お問い合わせメールが届きました。')
  end
end

class AnswerMail < ActionMailer::Base


  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.answer_mail.send_mail.subject
  #
  def send_mail(answer, email)

   @answer = answer
  	mail(from: 'mamamamani43@gmail.com', to: email , subject: 'あなたの質問が回答されました。')
  end
end

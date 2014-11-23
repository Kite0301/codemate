class TestMailer < ActionMailer::Base
   
  def sendmail_confirm(user)
    @user = user
    mail(to: user.email, subject:'ユーザー登録ありがとうございました。')
  end
end

class SignupMailer < ActionMailer::Base
  default from: 'no-reply@publicator'
  
  def confirm_email(user)
    @user = user
    # Link temporário pois a funcionalidade ainda
    # não existe, vamos criar ainda neste capítulo
    @confirmation_link = root_url
    mail({
    to: user.email,
    bcc: ['sign ups <signups@publicator>'],
    subject: I18n.t('signup.confirm_email.subject')
    })
  end
end

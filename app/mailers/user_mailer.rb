class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account activation - Health4All"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset - Health4All"
  end

  def bid_notification(user, artwork, bid)
    @user = user
    @artwork = artwork
    @bid = bid

    mail to: user.email, subject: "Health4All - You have placed a bid"
  end

  def outbid_notification(user, artwork)
    @artwork = artwork
    @user = user
    mail to: user.email, subject: "Health4All - You have been outbid"
  end

end

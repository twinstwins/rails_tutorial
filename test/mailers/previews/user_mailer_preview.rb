# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/account_activation

#user_mailer(コントローラー)で定義されている account_activation(user)のテスト
#user変数に値を代入し、そのactivation_token属性に手動でトークンを代入している
#なぜ、ここでこのような代入をするかというと、userモデルにおいてはbefore_actionを使って、
#アカウントがcreateされる前に自動生成されるように設定しているが、このテストではcreateを経由しない
  def account_activation
    user = User.first
    user.activation_token = User.new_token
    UserMailer.account_activation(user)
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/password_reset
  def password_reset
    user = User.first
    user.reset_token = User.new_token
    UserMailer.password_reset(user)
  end

end

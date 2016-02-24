class WelcomeController < ApplicationController
  # auth callback POST comes from Steam so we can't attach CSRF token
  skip_before_filter :verify_authenticity_token, :only => :auth_callback

  def index
  end

  def logout
    session[:current_user] = nil

    redirect_to :back
  end

  def auth_callback
    auth = request.env['omniauth.auth']
    session[:current_user] = { :nick => auth.info['nickname'],
                                          :image => auth.info['image'],
                                          :uid => auth.uid }
    login_check(session[:current_user])

    redirect_to root_url
  end

  def login_check(steam_user)
    user = User.find_by(steam_id: steam_user["uid"])
    if user.present?
      user.update_attributes(nick: steam_user["nick"], imagem: steam_user["image"])
    else
      new_user = User.new
      new_user["steam_id"] = steam_user[:uid]
      new_user["nick"] = steam_user[:nick]
      new_user["image"] = steam_user[:image]
      new_user.save
    end
  end
end

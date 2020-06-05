# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    authorization
  end

  def google_oauth2
    authorization
  end

  def twitter
    authorization
  end

  
  private

  def authorization
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.presisted?
      sign_in_and_redirect @user, event: :authentication
    else
      render template: 'users/registrations#new'
    end
  end
end

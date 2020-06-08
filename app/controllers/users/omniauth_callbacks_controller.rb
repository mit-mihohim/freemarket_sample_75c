# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    authorization
  end

  def google_oauth2
    authorization
  end

  
  private

  def authorization
    @user = User.from_omniauth(request.env["omniauth.auth"])
    @user.build_profile

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      render 'devise/registrations/new'
    end
  end
end

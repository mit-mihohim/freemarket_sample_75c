# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def google_oauth2
    authorization
  end

  
  private

  def authorization
    sns_info = User.from_omniauth(request.env["omniauth.auth"])
    @user = sns_info[:user]
    @user.build_profile

    if @user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect @user, event: :authentication
    else
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
      @sns_id = sns_info[:sns].id
      render 'devise/registrations/new'
    end
  end
end

class UsersController < ApplicationController
  before_action :set_profile, except: :show

  def show
  end

  def edit_profile
  end

  def update_profile
    @profile.update(profile_params)
    if @profile.save
      flash[:notice] = "変更内容が保存されました"
      redirect_to edit_profile_users_path
    else
      render :edit_profile
    end
  end

  private
  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :birthday)
  end
  
end

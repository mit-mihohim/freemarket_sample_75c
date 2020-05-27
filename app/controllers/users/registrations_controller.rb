class Users::RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
    @user.build_profile
  end

  def create
    @user = User.new(user_params)
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    session["profile_data"] = params[:user][:profile_attributes]
    @address = @user.build_address
    render :new_address
  end

  def new_address
  end

  def create_address
    @user = User.new(session["devise.regist_data"]["user"])
    @profile = @user.build_profile(session["profile_data"])
    @address = Address.new(address_params)
    unless @address.valid?
      flash.now[:alert] = @address.errors.full_messages
      render :new_address and return
    end
    @user.build_address(@address.attributes)
    @user.save
    @profile.save
    session["devise.regist_data"]["user"].clear
    session["profile_data"].clear
    sign_in(:user, @user)
  end

  protected
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, profile_attributes:[:last_name, :first_name, :last_name_kana, :first_name_kana, :birthday])
  end

  def address_params
    params.require(:address).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_number, :prefecture_id, :city, :house_number, :building_name, :phone_number)
  end

  def after_update_path_for(resource)
    flash[:notice] = "変更内容を保存しました"
    edit_user_registration_path
  end

end

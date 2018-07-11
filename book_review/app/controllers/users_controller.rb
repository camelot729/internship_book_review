class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
  end

  def edit
  end

  def update_password
    @user = current_user

    if @user.update_with_password(user_params)
      redirect_to root_path
    else
      render "edit"
    end

  end

  def show
  end

  def profile

  end

  def update
    @user = current_user

    if current_user.update(user_params)
      redirect_to @user, notice: 'User\'s information was successfully updated.'
    else
      render :edit
    end

  end


  def user_params
    params.require(:user).permit(:password, :password_confirmation, :first_name, :last_name, :email, :id, :avatar )
  end
end

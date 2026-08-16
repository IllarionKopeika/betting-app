class UsersController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]

  def new
    if authenticated?
      flash[:info] = "Нинада плодить аккаунты!"
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Грац, ты зареган!"
      redirect_to root_path
    else
      render "new", status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end

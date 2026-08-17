class SessionsController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { flash[:danger] = "На тебе временный бан!"
                                                                  redirect_to login_path
                                                                }

  def new
    if authenticated?
      flash[:warning] = "Нинада логиниться дважды!"
      redirect_to root_path
    end
  end

  def create
    if user = User.authenticate_by(params.permit(:email, :password))
      flash[:success] = "Логин ок"
      start_new_session_for user
      redirect_to after_authentication_url
    else
      flash[:danger] = "Намудрил с имейлом/паролем!"
      redirect_to login_path
    end
  end

  def destroy
    flash[:info] = "Пока-пока"
    terminate_session
    redirect_to root_path
  end
end

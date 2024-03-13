class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    user = User.find_by(email: params[:email])
    user&.send_password_reset_email if user
    redirect_to root_path, notice: 'Kiểm tra email để đặt lại mật khẩu.'
  end

  def edit

  end

  def update

  end
end

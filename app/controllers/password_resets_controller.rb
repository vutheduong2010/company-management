class PasswordResetsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user
      user.generate_reset_token # Tạo và lưu reset_token cho user
      UserMailer.password_reset_email(user).deliver_now
      # Tiếp tục xử lý khác
    else
      flash[:error] = "Email không tồn tại."
      render 'new'
    end
  end

  def edit
    @user = User.find_by(password_reset_token: params[:token])
    unless @user && @user.password_reset_token_valid?
      redirect_to forgot_password_path, alert: "Liên kết đặt lại mật khẩu không hợp lệ."
    end
  end

  def update
    @user = User.find_by(password_reset_token: params[:token])
    if @user && @user.password_reset_token_valid?
      if @user.update(password_params)
        @user.clear_password_reset_token
        redirect_to login_path, notice: "Mật khẩu đã được đặt lại. Vui lòng đăng nhập."
      else
        render :edit
      end
    else
      redirect_to forgot_password_path, alert: "Liên kết đặt lại mật khẩu không hợp lệ."
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end

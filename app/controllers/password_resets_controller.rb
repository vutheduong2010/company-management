class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user
      # Tạo mã đặt lại mật khẩu và gửi email đặt lại mật khẩu
      user.create_reset_digest
      user.send_password_reset_email
      flash[:success] = "Chúng tôi đã gửi một email đặt lại mật khẩu. Vui lòng kiểm tra hộp thư của bạn."
      redirect_to root_path
    else
      flash.now[:danger] = "Không tìm thấy người dùng với địa chỉ email này."
      render :new
    end
  end
end

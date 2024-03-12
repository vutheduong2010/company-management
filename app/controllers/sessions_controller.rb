class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      # Đăng nhập thành công
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Đăng nhập thành công'
    else
      # Đăng nhập thất bại
      flash.now[:alert] = 'Email hoặc mật khẩu không đúng'
      render :new
    end
    end

  def destroy
    log_out
    redirect_to root_url
  end
end
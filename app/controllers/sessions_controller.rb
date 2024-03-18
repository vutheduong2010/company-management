class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if params[:remember_me]
        cookies[:user_id] = { value: user.id, expires: 2.weeks.from_now }
      end
      redirect_to root_path, notice: "Đăng nhập thành công!"
    else
      flash.now[:alert] = "Email hoặc mật khẩu không đúng"
      render :new
    end
  end

  def remember_password
    @session = Session.new(session_params)
    if @session.save
      if params[:session][:remember_me] == '1'
        cookies.permanent[:remember_token] = @session.remember_token
      else
        cookies[:remember_token] = @session.remember_token
      end
      redirect_to root_path
    else
      render :new
    end
  end


  def destroy
    session[:user_id] = nil
    cookies.delete(:user_id)
    redirect_to login_path, notice: "Đã đăng xuất!"
  end
end
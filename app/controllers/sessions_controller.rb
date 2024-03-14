class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Đăng nhập thành công!"
    else
      flash[:alert] = "Đăng nhập không thành công. Vui lòng kiểm tra lại thông tin đăng nhập."
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
      render 'new'
    end
  end


  def destroy

      sessions.delete(:user_id)
      redirect_to root_path, notice: "Bạn đã đăng xuất thành công."
  end
end
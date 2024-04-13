class SessionsController < ApplicationController
  def new
  end

  def create

    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if params[:remember_me]
        cookies.encrypted[:user_id] = {
          value: user.id,
          expires: 2.weeks.from_now
        }
      end
      redirect_to root_path, notice: "Đăng nhập thành công!"
    else
      flash.now[:alert] = "Email hoặc mật khẩu không đúng"
      render :new
    end
  end

  def remember_password
    @remember_token = RememberToken.new(remember_token_params)
    if @remember_token.save
      if params[:session][:remember_me] == '1'
        cookies.permanent[:remember_token] = @remember_token.token
      else
        cookies[:remember_token] = { value: @remember_token.token, expires: 1.hour.from_now }
      end
      redirect_back fallback_location: root_path
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

private
def remember_token_params
  params.require(:remember_token).permit(:token)
end
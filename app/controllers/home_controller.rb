class HomeController < ApplicationController
  def index
  end

  def change_password
    user = current_user
    if user && user.authenticate(params[:current_password])
      if params[:new_password] == params[:confirm_password]
        user.update(password: params[:new_password])
        flash[:success] = "Password updated successfully!"
      else
        flash[:error] = "New password and confirm password do not match"
      end
    else
      flash[:error] = "Invalid current password"
    end
    redirect_to root_path
  end

  def update_password
    user = current_user
    if user && user.authenticate(params[:current_password])
      if params[:new_password] == params[:confirm_password]
        user.update(password: params[:new_password])
        flash[:success] = "Password updated successfully!"
      else
        flash[:error] = "New password and confirm password do not match"
      end
    else
      flash[:error] = "Invalid current password"
    end
    redirect_to login_path
  end
end

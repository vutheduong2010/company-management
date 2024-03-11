class UserController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user =User.new(user_params)
    if @user.save
      #redirect_to root_path, notice: "successfully created account"
      flash[:notice] = "Successfully created account"
      redirect_to root_path
    else
      flash.now[:alert]= "An error occurred while registering"
      render :new
      #flash[:notice] = 'Error' and redirect_to request.referer
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_cofirmation)
  end
end

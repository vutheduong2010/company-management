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

  def send_password_reset_email
    generate_password_reset_token
    save!
    UserMailer.password_reset(self).deliver_now
  end



  private
  def user_params
    params.require(:user).permit(:email, :password, :password_cofirmation)
  end

  def generate_password_reset_token
    self.reset_token = SecureRandom.urlsafe_base64
    self.reset_sent_at = Time.now.utc
  end
end

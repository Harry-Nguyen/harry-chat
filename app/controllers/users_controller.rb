class UsersController < ApplicationController
  def index
    @users = User.all
    @friends = Friendship.where(owner_id: session[:user_id])
  end

	def new
		@user = User.new
	end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = 'User is created successfully'
      redirect_to users_path
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation);
  end
end

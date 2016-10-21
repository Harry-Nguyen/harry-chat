class FriendshipsController < ApplicationController
  def index
    @friendships = Friendship.where(owner_id: session[:user_id])
  end

  def create
    @fs = Friendship.new
    @fs.owner_id = session[:user_id].to_i
    @fs.friend_id = params[:friend_id].to_i
    if @fs.save
      redirect_to friend_list_path
    else
      redirect_to users_path
    end
  end
end

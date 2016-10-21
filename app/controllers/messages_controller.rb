class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def inbox
    @messages = Message.where(recipient_id: session[:user_id])
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new message_params
    if @message.save
      flash[:success] = 'Message is created successfully'
      redirect_to messages_path
    else
      render 'new'
    end
  end

  def message_params
    params.require(:message).permit(:sender_id, :recipient_id, :title, :body);
  end
end

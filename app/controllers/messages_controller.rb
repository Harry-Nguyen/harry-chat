class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def inbox
    @messages = Message.where(recipient_id: session[:user_id])
    @messages = @messages.sort{|x, y| y.created_at <=> x.created_at}
  end

  def sent
    @messages = Message.where(sender_id: session[:user_id])
    @messages = @messages.sort{|x, y| y.created_at <=> x.created_at}
  end

  def show
    
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

  def read
    @message = Message.find(params[:id])
    @message.read_at = Time.now
    if @message.save
      flash[:success] = 'This message is marked as read'
    else
      redirect_to inbox_path
    end
  end

  def message_params
    params.require(:message).permit(:sender_id, :recipient_id, :title, :body);
  end
end

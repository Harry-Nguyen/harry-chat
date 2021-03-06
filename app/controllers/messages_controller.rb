class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
    @is_recipient = false
    @read_before = false

    if @message.recipient_id == session[:user_id]
      @is_recipient = true
    end
    if @message.read_at
      @read_before = true
    end
  end

  def inbox
    @messages = Message.where(recipient_id: session[:user_id])
    @messages = @messages.sort{|x, y| y.created_at <=> x.created_at}
  end

  def sent
    @messages = Message.where(sender_id: session[:user_id])
    @messages = @messages.sort{|x, y| y.created_at <=> x.created_at}
  end

  def new
    @message = Message.new
    @friendship = Friendship.where(owner_id: session[:user_id])
  end

  def create
    @message = Message.new message_params
    @message.sender_id = session[:user_id]

    if @message.save
      flash[:success] = 'Message is created successfully'
      redirect_to sent_path
    else
      render 'new'
    end
  end

  def read
    @message = Message.find(params[:id])
    @read_before = false

    if @message.read_at
      @read_before = true
    else
      @message.read_at = Time.now
      if @message.save
        flash[:success] = 'This message is marked as read'
      else
        redirect_to inbox_path
      end
    end
  end

  def message_params
    params.require(:message).permit(:recipient_id, :title, :body);
  end
end

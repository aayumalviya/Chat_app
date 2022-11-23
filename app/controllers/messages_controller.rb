class MessagesController < ApplicationController
  def index
    all_messages = []
    @user = User.find(params[:user_id])
    all_messages << Message.where(user_id: current_user.id, reciever_id: params[:user_id])
    all_messages << Message.where(user: params[:user_id], reciever_id: current_user.id)
    @messages = all_messages.flatten.sort
    # order by id
  end

  def show
    @user = User.find(params[:user_id])
    @message = Message.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @message = User.messages.new

    respond_to do |format|
      format.js
    end
  end

  def create
    @message = current_user.messages.new(message_Params)
    @message.reciever_id = params[:user_id]
    @message.save
  end

  private

  def message_Params
    params.require(:message).permit(:content)
  end
end

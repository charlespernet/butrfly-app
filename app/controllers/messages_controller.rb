class MessagesController < ApplicationController
  before_action :set_conversation

  def index
    @messages = @conversation.messages
    @new_message = Message.new
  end

  def create
    @message = @conversation.messages.new(message_params)
    @message.save
    redirect_to conversation_messages_path(@conversation)
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
    authorize @conversation
  end

  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end

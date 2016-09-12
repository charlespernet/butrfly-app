class MessagesController < ApplicationController
  def index
    conversation = Conversation.find(params[:conversation_id])
    authorize conversation
    @messages = conversation.messages
  end
end

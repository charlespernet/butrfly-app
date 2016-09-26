class ConversationsController < ApplicationController
  def create
    sender = User.find(params[:sender_id])
    recipient = User.find(params[:recipient_id])
    retrieved_conversation = Conversation.between(sender, recipient)
    if retrieved_conversation.any?
      @conversation = retrieved_conversation.first
    else
      @conversation = Conversation.create!(conversation_params)
    end
   redirect_to conversation_messages_path(@conversation)
  end

  private

  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end

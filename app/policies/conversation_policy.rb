class ConversationPolicy < ApplicationPolicy
  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    @user == record.sender || @user == record.recipient
  end
end

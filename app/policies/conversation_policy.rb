class ConversationPolicy < ApplicationPolicy
  # overriding user from ApplicationPolicy because i need the acting_as user id,
  # not the specific one.
  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    @user == record.sender || @user == record.recipient
  end
end

class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user

  validates :body, presence: true
  validates :user, presence: true
  validates :conversation, presence: true
end

class Conversation < ActiveRecord::Base
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'

  has_many :messages, dependent: :destroy

  validates :sender, uniqueness: { scope: :recipient }

  scope :between, -> (sender, recipient) do
    where(
      "(conversations.sender_id = ? AND conversations.recipient_id = ?)
      OR
      (conversations.sender_id = ? AND conversations.recipient_id = ?)", sender.id, recipient.id, recipient.id, sender.id
    )
  end

  scope :involving, -> (user) do
   where("conversations.sender_id = ? OR conversations.recipient_id = ?", user.id, user.id)
 end
end

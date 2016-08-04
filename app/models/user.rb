class User < ActiveRecord::Base
  actable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :initiated_conversations, class_name: 'Conversation', foreign_key: 'sender_id'
  has_many :received_conversations, class_name: 'Conversation', foreign_key: 'recipient_id'

  # Probably to remove, just need to check before
  TYPES = ["Aupair", "Family"]
  DEVISE_TYPES = [[I18n.t(:aupair).capitalize, 'Aupair'] ,[I18n.t(:family).capitalize, 'Family']]

  def country_name
    country = ISO3166::Country[country_code]
    return nil unless country
    country.translations[I18n.locale.to_s] || country.name
  end
end

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

  def active?(date = Date.today)
    # end_date > date_to_try
    # return false unless active_until
    # active_until > date
    active_until.present? && active_until > date
  end

  def customer
    return Stripe::Customer.retrieve(stripe_id) if stripe_id.present?
    customer = Stripe::Customer.create(email: email)
    update(stripe_id: customer.id)
    customer
  end

  def set_new_default_card(token)
    card = customer.sources.create(source: token)
    customer.default_source = card.id
    customer.save
  end

  def create_charge(amount)
    Stripe::Charge.create(
      customer:    customer.id,
      amount:      amount,
      description: 'Butrfly customer',
      currency:    'eur'
    )
    update(active_until: Date.today + 10.years)
  end

end

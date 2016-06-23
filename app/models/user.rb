class User < ActiveRecord::Base
  actable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum gender: {not_telling: 0, male: 1, female: 2}
  enum dispo_length: {"< de 3 mois" => 0, "de 3 à 6 mois" => 1, "de 6 à 12 mois" => 2, "> 12 mois" => 3}
  TYPES = ["Aupair", "Family"]

  def dispo_length_txt
    User.dispo_lengths.key(self.specific.dispo_length)
  end

  def country_name
    country = ISO3166::Country[country_code]
    country.translations[I18n.locale.to_s] || country.name
  end
end

class User < ActiveRecord::Base
  actable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum gender: {"Not telling" => 0, "Male" => 1, "Female" => 2}
  enum dispo_length: {"< de 3 mois" => 0, "de 3 à 6 mois" => 1, "de 6 à 12 mois" => 2, "> 12 mois" => 3}
  enum family_type: {"Nucléaire" => 0, "Monoparentale" => 1, "Homoparentale" => 2, "Recomposée" => 3}
  TYPES = ["Aupair", "Family"]

  def prefered_gender_aupair_txt
    User.genders.key(self.specific.prefered_gender_aupair)
  end

  def gender_txt
    User.genders.key(self.specific.gender)
  end

  def dispo_length_txt
    User.dispo_lengths.key(self.specific.dispo_length)
  end

  def family_type_txt
    User.family_types.key(self.specific.family_type)
  end

  def country_name
    country = ISO3166::Country[country_code]
    country.translations[I18n.locale.to_s] || country.name
  end
end

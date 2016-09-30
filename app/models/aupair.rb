class Aupair < ActiveRecord::Base
  COMPLETION_ATTRIBUTES =  %w(first_name
    last_name
    birth_date
    description
    driving_license
    dispo_from
    stay_duration_cd)

  has_attachment :photo
  acts_as :user
  has_many :spoken_languages
  has_many :languages, through: :spoken_languages

  has_many :prefered_countries
  has_many :countries, through: :prefered_countries

  as_enum :gender, undefined: 0, male: 1, female: 2

  # very_short = "< de 3 mois"
  # short = "de 3 à 6 mois"
  # long = "de 6 à 12 mois"
  # very_long = "> 12 mois"
  as_enum :stay_duration, very_short: 0, short: 1, long: 2, very_long: 3

  # Aupair dispo une semaine avant et un mois apres la date de recherche
  scope :dispo_at_date, -> (date = Date.today) { where(dispo_from: date-1.weeks..date+1.months) }
  scope :want_to_come_to, -> (country_code) { joins(:countries).where({ countries: { code: country_code } }) }

  def age
    return nil unless birth_date
    (Date.today - birth_date).to_i / 365.25.floor
  end

  def profile_completion
    count = 0
    COMPLETION_ATTRIBUTES.each do |a|
      count += 1 if attribute_present?(a)
    end
    count * 100 / COMPLETION_ATTRIBUTES.count
  end
end

class Family < ActiveRecord::Base
  acts_as :user
  as_enum :family_type, nuclear: 0, single: 1, homo: 2, blended: 3
  as_enum :prefered_gender, Aupair.genders
  as_enum :prefered_duration, Aupair.stay_durations

  scope :from_country, -> (country_code) { where(country_code: country_code) }
  # Famille cherchant deux semaines avant et deux semaines apres la date de recherche
  scope :searching_at_date, -> (date = Date.today) { where(starting_date: date-2.weeks..date+2.weeks) }
end

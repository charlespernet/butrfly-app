class Family < ActiveRecord::Base
  COMPLETION_ATTRIBUTES =  %w(name
    country_code
    children_age_from
    children_age_to
    children_number
    family_type
    experience_with_aupair)

  has_attachments :photos, maximum: 5
  acts_as :user
  as_enum :family_type, nuclear: 0, single: 1, homo: 2, blended: 3
  as_enum :prefered_gender, Aupair.genders
  as_enum :prefered_duration, Aupair.stay_durations

  scope :from_country, -> (country_code) { where(country_code: country_code) }
  # Famille cherchant deux semaines avant et deux semaines apres la date de recherche
  scope :searching_at_date, -> (date = Date.today) { where(starting_date: date-2.weeks..date+2.weeks) }

  def profile_completion
    count = 0
    COMPLETION_ATTRIBUTES.each do |a|
      count += 1 if attribute_present?(a)
    end
    count * 100 / COMPLETION_ATTRIBUTES.count
  end

end

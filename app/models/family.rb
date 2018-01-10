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

  enum house_type: { maison: 1, appartement: 2 }
  enum environment: { ville: 1, village: 2,  mer_ocean: 3,  montagne: 4, campagne: 5 }


  scope :from_country, -> (country_code) { where(country_code: country_code) }
  # Famille cherchant deux semaines avant et deux semaines apres la date de recherche
  scope :searching_at_date, -> (date = Date.today) { where(starting_date: date-2.weeks..date+2.weeks) }

  def profile_completion
    present_attrs = attributes.select do |k, v|
      COMPLETION_ATTRIBUTES.include?(k) &&
      !v.to_s.empty?
    end
    present_attrs.size * 100 / COMPLETION_ATTRIBUTES.size
  end


  def self.plans
    Stripe::Plan.all.data.select do |plan|
      plan.metadata[:visible] == "true" &&
      plan.metadata[:customer] == "family"
    end
  end

end

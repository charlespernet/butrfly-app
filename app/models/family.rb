class Family < ActiveRecord::Base
  acts_as :user
  as_enum :family_type, nuclear: 0, single: 1, homo: 2, blended: 3
  as_enum :prefered_gender, Aupair.genders
  as_enum :prefered_duration, Aupair.stay_durations
end

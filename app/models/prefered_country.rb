class PreferedCountry < ActiveRecord::Base
  belongs_to :aupair
  belongs_to :country
end

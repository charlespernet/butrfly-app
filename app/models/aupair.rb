class Aupair < ActiveRecord::Base
  acts_as :user
  has_many :spoken_languages
  has_many :languages, through: :spoken_languages

  has_many :prefered_countries
  has_many :countries, through: :prefered_countries

  # Returns User's gender as text
  def gender_txt
    User.genders.key(self.gender)
  end
end

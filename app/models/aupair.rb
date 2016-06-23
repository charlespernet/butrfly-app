class Aupair < ActiveRecord::Base
  acts_as :user
  has_many :spoken_languages
  has_many :languages, through: :spoken_languages

  # Returns User's gender as text
  def gender_txt
    User::GENDERS[self.gender - 1]
  end

  # Returns User's prefered countries as text
  def prefered_countries_txt
    prefered_countries.map { |i| Aupair::PREFERED_COUNTRIES[i-1]  }
  end
end

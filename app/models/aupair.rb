class Aupair < ActiveRecord::Base
  acts_as :user

  LANGUAGES =
  [
    "France",
    "Italie",
    "Espagne",
    "Allemagne",
    "Royaume-uni",
    "Belgique",
  ]


  # Returns User's gender as text
  def gender_txt
    User::GENDERS[self.gender - 1]
  end

  # Returns User's prefered countries as text
  def prefered_countries_txt
    prefered_countries.map { |i| Aupair::PREFERED_COUNTRIES[i-1]  }
  end
end

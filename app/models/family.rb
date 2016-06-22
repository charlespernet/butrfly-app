class Family < ActiveRecord::Base
  acts_as :user

  def length_of_stay_txt
    [
      "non précisé",
      "< de 3 mois",
      "de 3 à 6 mois",
      "de 6 à 9 mois",
      "de 9 à 12 mois",
      "> 12 mois"
    ][length_of_stay - 1]
  end
end

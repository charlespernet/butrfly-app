class Aupair < ActiveRecord::Base
  acts_as :user

  # Returns User's gender as text
  def gender_txt
    User::GENDERS[self.gender - 1]
  end
end

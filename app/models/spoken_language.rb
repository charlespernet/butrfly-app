class SpokenLanguage < ActiveRecord::Base
  belongs_to :aupair
  belongs_to :language
end

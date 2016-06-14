class Child < ActiveRecord::Base
  belongs_to :family

  validates :family, presence: :true
end

class AddAupairExperienceToFamilies < ActiveRecord::Migration[5.0]
  def change
    add_column :families, :aupair_experience, :boolean
  end
end

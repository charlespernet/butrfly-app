class AddEducationalExperienceToAupairs < ActiveRecord::Migration
  def change
    add_column :aupairs, :educational_experience, :boolean
  end
end

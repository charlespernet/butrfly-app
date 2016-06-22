class AddExperienceAupairToAupairs < ActiveRecord::Migration
  def change
    add_column :aupairs, :experience_aupair, :boolean
  end
end

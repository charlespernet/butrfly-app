class AddAttributesToAupairs < ActiveRecord::Migration
  def change
    add_column :aupairs, :experience_aupair, :boolean
    add_column :aupairs, :educational_experience, :boolean
    add_column :aupairs, :accepted_domestic_animal, :boolean
    add_column :aupairs, :sports, :boolean
  end
end

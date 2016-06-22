class AddAttributesToAupairs < ActiveRecord::Migration
  def change
    remove_column :aupairs, :smoker
    add_column :aupairs, :experience_aupair, :boolean
    add_column :aupairs, :educational_experience, :boolean
    add_column :aupairs, :accepted_domestic_animal, :boolean
    add_column :aupairs, :sports, :boolean
    add_column :aupairs, :mother_tongue, :integer
    add_column :aupairs, :languages_spoken, :integer, array:true, default:[]
    add_column :aupairs, :prefered_countries, :string, array:true, default:[]
  end
end

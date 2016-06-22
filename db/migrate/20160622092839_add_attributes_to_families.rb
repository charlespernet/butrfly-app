class AddAttributesToFamilies < ActiveRecord::Migration
  def change
    add_column :families, :children_age_from, :integer
    add_column :families, :children_age_to, :integer
    add_column :families, :children_number, :integer
    add_column :families, :description, :text
    add_column :families, :prefered_gender_aupair, :integer, default: 0
    add_column :families, :starting_date, :date
    add_column :families, :length_of_stay, :integer, default: 0
    add_column :families, :experience_with_aupair, :boolean
    add_column :families, :family_type, :integer, default: 0
    add_column :families, :housework, :boolean
    add_column :families, :driving_license_required, :boolean
    remove_column :families, :smoker
  end
end

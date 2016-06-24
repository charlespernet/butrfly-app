class PrepareFamiliesForSimpleEnum < ActiveRecord::Migration
  def change
    rename_column :families, :family_type, :family_type_cd
    rename_column :families, :prefered_gender_aupair, :prefered_gender_cd
    rename_column :families, :length_of_stay, :prefered_duration_cd
  end
end

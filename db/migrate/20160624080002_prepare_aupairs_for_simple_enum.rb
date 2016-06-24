class PrepareAupairsForSimpleEnum < ActiveRecord::Migration
  def change
    rename_column :aupairs, :gender, :gender_cd
    rename_column :aupairs, :dispo_length, :stay_duration_cd
  end
end

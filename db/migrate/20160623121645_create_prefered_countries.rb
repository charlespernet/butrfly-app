class CreatePreferedCountries < ActiveRecord::Migration
  def change
    create_table :prefered_countries do |t|
      t.references :aupair, index: true, foreign_key: true
      t.references :country, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

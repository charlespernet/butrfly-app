class CreateAupairs < ActiveRecord::Migration
  def change
    create_table :aupairs do |t|
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.text :description
      t.boolean :driving_license
      t.boolean :musician
      t.boolean :smoker

      t.timestamps null: false
    end
  end
end

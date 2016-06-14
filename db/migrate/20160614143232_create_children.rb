class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :first_name
      t.date :birth_date
      t.boolean :musician
      t.string :disease
      t.string :handicap
      t.references :family, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

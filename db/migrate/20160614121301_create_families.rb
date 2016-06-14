class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|

      t.timestamps null: false
      t.string :name
      t.boolean :smoker
      t.boolean :domestic_animal
    end
  end
end

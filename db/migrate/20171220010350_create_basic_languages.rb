class CreateBasicLanguages < ActiveRecord::Migration[5.0]
  def change
    create_table :basic_languages do |t|
      t.references :aupair, foreign_key: true
      t.references :language, foreign_key: true

      t.timestamps
    end
  end
end

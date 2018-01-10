class AddAupairNationalityToFamilies < ActiveRecord::Migration[5.0]
  def change
    add_column :families, :aupair_nationality, :string
  end
end

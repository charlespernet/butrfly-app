class AddColumnsToFamilies < ActiveRecord::Migration[5.0]
  def change
    add_column :families, :first_name, :string
    add_column :families, :last_name, :string
    add_column :families, :phone, :string
    add_column :families, :address, :string
    add_column :families, :city, :string
    add_column :families, :country, :string
    add_column :families, :aupair_children_number, :integer
    add_column :families, :house_type, :integer
    add_column :families, :environment, :integer
  end
end

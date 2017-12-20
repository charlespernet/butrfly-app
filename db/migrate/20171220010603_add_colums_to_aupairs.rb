class AddColumsToAupairs < ActiveRecord::Migration[5.0]
  def change
    add_column :aupairs, :phone, :string
    add_column :aupairs, :address, :string
    add_column :aupairs, :city, :string
    add_column :aupairs, :country, :string
    add_column :aupairs, :environment, :integer
    add_column :aupairs, :favorite_region, :string
    add_column :aupairs, :housework, :boolean
  end
end

class AddSportsToAupairs < ActiveRecord::Migration
  def change
    add_column :aupairs, :sports, :boolean
  end
end

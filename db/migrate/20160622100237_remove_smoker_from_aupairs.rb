class RemoveSmokerFromAupairs < ActiveRecord::Migration
  def change
    remove_column :aupairs, :smoker
  end
end

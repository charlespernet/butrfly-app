class RemoveTimestampsFromAupairs < ActiveRecord::Migration
  def change
    remove_column :aupairs, :created_at
    remove_column :aupairs, :updated_at
  end
end

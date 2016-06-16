class RemoveTimestampsFromFamilies < ActiveRecord::Migration
  def change
    remove_column :families, :created_at
    remove_column :families, :updated_at
  end
end

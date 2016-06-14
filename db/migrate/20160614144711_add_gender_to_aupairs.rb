class AddGenderToAupairs < ActiveRecord::Migration
  def change
    add_column :aupairs, :gender, :integer, :default => 1
  end
end

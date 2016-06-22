class AddMotherTongueToAupairs < ActiveRecord::Migration
  def change
    add_column :aupairs, :mother_tongue, :integer, array: true, default:[]
  end
end

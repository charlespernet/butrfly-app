class AddPhotoToAupair < ActiveRecord::Migration
  def change
    add_column :aupairs, :photo, :string
  end
end

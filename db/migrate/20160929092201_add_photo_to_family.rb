class AddPhotoToFamily < ActiveRecord::Migration
  def change
    add_column :families, :photo, :string
  end
end

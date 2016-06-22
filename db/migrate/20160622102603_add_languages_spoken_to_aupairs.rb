class AddLanguagesSpokenToAupairs < ActiveRecord::Migration
  def change
    add_column :aupairs, :languages_spoken, :integer, array:true, default:[]
  end
end

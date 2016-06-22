class AddPreferedCountriesToAupairs < ActiveRecord::Migration
  def change
    add_column :aupairs, :prefered_countries, :integer, array:true, default:[]
  end
end

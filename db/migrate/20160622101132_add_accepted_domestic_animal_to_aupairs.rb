class AddAcceptedDomesticAnimalToAupairs < ActiveRecord::Migration
  def change
    add_column :aupairs, :accepted_domestic_animal, :boolean
  end
end

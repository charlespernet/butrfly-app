class AddDateAndLengthOfStayToAupairs < ActiveRecord::Migration
  def change
    add_column :aupairs, :dispo_from, :date
    add_column :aupairs, :dispo_length, :integer
  end
end

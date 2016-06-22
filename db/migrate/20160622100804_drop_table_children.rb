class DropTableChildren < ActiveRecord::Migration
  def change
    drop_table :children
  end
end

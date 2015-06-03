class AddCompletedToMaterials < ActiveRecord::Migration
  def change
    add_column :materials, :completed, :boolean, null: false, default: false
  end
end

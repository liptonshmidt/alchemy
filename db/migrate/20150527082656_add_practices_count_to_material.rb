class AddPracticesCountToMaterial < ActiveRecord::Migration
  def change
    add_column :materials, :practices_count, :integer, default: 0, null: false
  end
end

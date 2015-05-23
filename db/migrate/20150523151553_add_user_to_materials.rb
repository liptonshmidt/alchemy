class AddUserToMaterials < ActiveRecord::Migration
  def change
    add_reference :materials, :user, index: true
  end
end

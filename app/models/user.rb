class User < ActiveRecord::Base
  include Clearance::User

  has_many :materials, -> { order(created_at: :desc) }

  def find_material(material_id)
    materials.find(material_id)
  end
end

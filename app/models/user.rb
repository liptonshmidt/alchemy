class User < ActiveRecord::Base
  include Clearance::User

  has_many :materials

  def find_material(material_id)
    materials.find(material_id)
  end
end

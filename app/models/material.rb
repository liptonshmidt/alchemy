class Material < ActiveRecord::Base
  validates :title, presence: true
end

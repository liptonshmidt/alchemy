class Material < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true

  def practice
    increment!(:practices_count)
  end
end

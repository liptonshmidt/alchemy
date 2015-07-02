class Material < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true

  scope :completed, ->{ where(completed: true) }
  scope :incompleted, ->{ where(completed: false) }

  def practice
    increment!(:practices_count)
  end

  def complete
    update_attributes(completed: true)
  end

  def make_active
    update_attributes(completed: false)
  end
end

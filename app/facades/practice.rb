class Practice
  def initialize(user)
    @user = user
  end

  def completed_materials
    @user.materials.completed
  end

  def incompleted_materials
    @user.materials.incompleted
  end
end

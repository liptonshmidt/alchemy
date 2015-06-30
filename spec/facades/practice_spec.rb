require "rails_helper"

describe Practice do
  describe "#completed_materials" do
    it "lists only completed materials for user" do
      user = create(:user)
      completed_material = create(:material, completed: true, user: user)
      active_material = create(:material, completed: false, user: user)
      practice = Practice.new(user)

      expect(practice.completed_materials).to eq([completed_material])
    end
  end

  describe "#incompleted_materials" do
    it "lists only incompleted materials for user" do
      user = create(:user)
      completed_material = create(:material, completed: true, user: user)
      active_material = create(:material, completed: false, user: user)
      practice = Practice.new(user)

      expect(practice.incompleted_materials).to eq([active_material])
    end
  end
end

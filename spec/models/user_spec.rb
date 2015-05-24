require "rails_helper"

describe User do
  it { should have_many(:materials) }

  describe "#find_material" do
    it "finds user's material" do
      user = create(:user)
      material = create(:material, user: user)

      expect(user.find_material(material.id)).to eq(material)
      expect(user.find_material(material.id.to_s)).to eq(material)
    end

    it "doesn't find another user's material" do
      another_user = create(:user)
      another_material = create(:material, user: another_user)
      user = create(:user)

      expect do
        user.find_material(another_material.id)
      end.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end

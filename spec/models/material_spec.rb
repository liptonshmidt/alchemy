require 'rails_helper'

describe Material do
  it { should validate_presence_of(:title) }
  it { should belong_to(:user) }

  describe "#practice" do
    it "should increase practices_count" do
      material = create(:material)

      expect do
        material.practice
      end.to change { material.reload.practices_count }.by(1)
    end
  end

  describe "#complete" do
    it "should set :completed to true" do
      material = create(:material, completed: false)

      material.complete

      material.reload
      expect(material.completed).to be_truthy
    end
  end

  describe "#make_active" do
    it "should set :completed to false" do
      material = create(:material, completed: true)

      material.make_active

      material.reload
      expect(material.completed).to be_falsey
    end
  end
end

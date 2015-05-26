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
end

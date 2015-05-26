require "rails_helper"

describe Material::PracticesController, "#create" do
  context "signed in" do
    it "finds user's material" do
      user = build_stubbed(:user)
      material = stub_material_for_user(user)
      allow(material).to receive(:practice)

      sign_in_as(user)
      post_create(material)

      expect(user).to have_received(:find_material)
    end

    it "sends #practice to materials" do
      user = build_stubbed(:user)
      material = stub_material_for_user(user)
      allow(material).to receive(:practice)

      sign_in_as(user)
      post_create(material)

      expect(material).to have_received(:practice)
    end

    it "redirects to material_path" do
      user = build_stubbed(:user)
      material = stub_material_for_user(user)
      allow(material).to receive(:practice)

      sign_in_as(user)
      post_create(material)

      expect(controller).to redirect_to(materials_path)
    end
  end

  context "signed out" do
    it "redirects to sign in" do
      material = build_stubbed("material")

      sign_out
      post_create(material)

      expect(controller).to redirect_to(sign_in_path)
    end
  end

  def post_create(material)
      post :create, material_id: material.id
  end

  def stub_material_for_user(user)
    build_stubbed(:material, user: user).tap do |material|
      stub_material_search(user: user, material: material)
    end
  end

  def stub_material_search(user:, material:)
    allow(user).to receive(:find_material).and_return(material)
  end
end

require "rails_helper"

describe Material::CompletionsController, "#create" do
  it "finds user's material" do
    user = build_stubbed(:user)
    material = build_stubbed(:material)
    stub_material_search(material, user)
    allow(material).to receive(:complete)

    sign_in_as(user)
    post :create, material_id: material.id

    expect(user).to have_received(:find_material)
  end

  it "sends :complete to material" do
    user = build_stubbed(:user)
    material = build_stubbed(:material)
    stub_material_search(material, user)
    allow(material).to receive(:complete)

    sign_in_as(user)
    post :create, material_id: material.id

    expect(material).to have_received(:complete)
  end

  it "redirects to materials_path" do
    user = build_stubbed(:user)
    material = build_stubbed(:material)
    stub_material_search(material, user)
    allow(material).to receive(:complete)

    sign_in_as(user)
    post :create, material_id: material.id

    expect(controller).to redirect_to(materials_path)
  end
end

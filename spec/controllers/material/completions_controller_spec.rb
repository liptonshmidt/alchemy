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

  it "redirects to practice_path" do
    user = build_stubbed(:user)
    material = build_stubbed(:material)
    stub_material_search(material, user)
    allow(material).to receive(:complete)

    sign_in_as(user)
    post :create, material_id: material.id

    expect(controller).to redirect_to(practice_path)
  end
end

describe Material::CompletionsController, "#destroy" do
  it "sends :make_active to material" do
    user = build_stubbed(:user)
    material = build_stubbed(:material, completed: false)
    stub_material_search(material, user)
    allow(material).to receive(:make_active)

    sign_in_as(user)
    delete :destroy, material_id: material.id

    expect(material).to have_received(:make_active)
  end

  it "redirects to practice_path" do
    user = build_stubbed(:user)
    material = build_stubbed(:material, completed: false)
    stub_material_search(material, user)
    allow(material).to receive(:make_active)

    sign_in_as(user)
    delete :destroy, material_id: material.id

    expect(controller).to redirect_to(practice_path)
  end
end

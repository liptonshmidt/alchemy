require 'rails_helper'

describe MaterialsController, "#create" do
  context "signed in with valid material" do
    it "creates material" do
      material = stub_material

      sign_in
      post_create

      expect(material).to have_received(:save)
      expect(controller).to redirect_to(material)
    end
  end

  context "signed in with invalid material" do
    it "re-renders the form" do
      material = stub_material(save: false)

      sign_in
      post_create

      expect(controller).to render_template(:new)
    end
  end

  context "signed out with valid material" do
    it "redirects to sign in form" do
      material = stub_material

      sign_out
      post_create

      expect(controller).to redirect_to(sign_in_path)
    end
  end

  let(:material_params) { attributes_for(:material) }

  def stub_material(save: true)
    build_stubbed(:material).tap do |material|
      allow(Material).to receive(:new).with(material_params).
        and_return(material)
      allow(material).to receive(:save).and_return(save)
    end
  end

  def post_create
    post :create, material: material_params
  end
end


describe MaterialsController, "#index" do
  it "shows materials" do
    materials = double("materials")
    allow(Material).to receive(:all).and_return(materials)

    sign_in
    get :index

    expect(assigns(:materials)).to eq(materials)
    expect(response).to be_success
  end
end

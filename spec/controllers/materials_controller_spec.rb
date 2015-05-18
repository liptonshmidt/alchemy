require 'rails_helper'

describe MaterialsController, "#create" do
  context "with valid material" do
    it "creates material" do
      material = stub_material(save: true)

      post_create

      expect(material).to have_received(:save)
      expect(controller).to redirect_to(material)
    end
  end

  context "with invalid material" do
    it "re-renders the form" do
      material = stub_material(save: false)

      post_create

      expect(controller).to render_template(:new)
    end
  end

  let(:material_params) { attributes_for(:material) }

  def stub_material(save:)
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

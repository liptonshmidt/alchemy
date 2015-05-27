module MaterialStubs
  def stub_material_search(material, user = material.user)
    allow(user).to receive(:find_material).and_return(material)
  end
end

RSpec.configure do |config|
  config.include MaterialStubs, type: :controller
end

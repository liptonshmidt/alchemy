require "rails_helper"

describe PracticeController, "#show" do
  it "assigns practice" do
    user = build_stubbed(:user)
    practice = double("practice")
    expect(Practice).to receive(:new).with(user).and_return(practice)

    sign_in_as(user)
    get :show

    expect(assigns(:practice)).to eq(practice)
    expect(response).to be_success
  end
end

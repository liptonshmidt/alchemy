FactoryGirl.define do
  sequence :title do |n|
    "title #{n}"
  end

  factory :material do
    user
    title
  end
end

FactoryGirl.define do
  factory :comment do
    user nil
    painting nil
    content "MyText"
  end
end

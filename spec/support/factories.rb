FactoryGirl.define do

  factory :gif do
    image_path
  end

  sequence :image_path do |n|
    Faker::Avatar.image("50x5#{n}")
  end

end

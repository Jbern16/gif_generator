FactoryGirl.define do

  factory :category do
    name
  end

  sequence :name, ["Surreal", "Cubist", "Impressionism"].cycle do |title|
    title
  end

  factory :gif do
    image_path
    category
  end

  sequence :image_path do |n|
    Faker::Avatar.image("25x25")
  end

end

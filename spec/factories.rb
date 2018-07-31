FactoryBot.define do
  factory :user do
    sequence(:email){ |n| "user#{n}@test.com"}
    password "123456"
  end

  factory :book do
    sequence(:title){ |n| "Books Title ##{n}"}
    review "Books Review"
  end
end

FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password "password"
    first_name "Jon"

    factory :admin do
      sequence :email do |n|
        "admin#{n}@example.com"
      end
      role 1
    end
  end


  factory :item do
    sequence :title do |n|
      "item #{n}"
    end
    description "Some item"
    price 9.99
    image_path "example.jpg"

    factory :retired_item do
      sequence :title do |n|
        "retired item #{n}"
      end
      state 1
    end
  end

  factory :order do
    user

    factory :paid_order do
      status 1
    end

    factory :cancelled_order do
      status 2
    end

    factory :completed_order do
      status 3
    end
  end

  factory :order_item do
    item
    order
    quantity 1
  end
end

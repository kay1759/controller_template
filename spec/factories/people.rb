FactoryBot.define do
  factory :person do
    name { "John Smith" }
    email { "user@example.com" }
    age { 30 }
  end

  sequence :person_name do |i|
    "John_#{i} Smith"
  end

  sequence :person_email do |i|
    "user_#{i}@example.com"
  end

  factory :people, class: Person do
    name { generate :person_name }
    email { generate :person_email }
    age { 30 }
  end
end

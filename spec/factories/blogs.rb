FactoryBot.define do
  factory :blog do
    name { "it" }
    title { "Information Technology" }
    content { "Blog about Information Technology" }
  end

  sequence :blog_name do |i|
    "blog_name_#{i}"
  end

  sequence :blog_title do |i|
    "Blog Title #{i}"
  end

  factory :blogs, class: Blog do
    name { generate :blog_name }
    title { generate :blog_title }
    content { "Blog Content" }
  end
end

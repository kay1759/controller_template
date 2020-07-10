FactoryBot.define do
  factory :blog_post do
    blog_id { FactoryBot.create(:blog).id }
    name { "controller_template" }
    title { "Rails Controller Templete" }
    content { "Experiment about Rails Controller Template" }
  end

  sequence :name do |i|
    "blog_post_name_#{i}"
  end

  sequence :title do |i|
    "Blog Post Title #{i}"
  end

  factory :blog_posts, class: BlogPost do
    blog_id { FactoryBot.create(:blog).id }
    name { generate :name }
    title { generate :title }
    content { "Blog Post Content" }
  end
end

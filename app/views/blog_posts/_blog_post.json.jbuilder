json.extract! blog_post, :id, :blog_id, :name, :title, :content, :created_at, :updated_at
json.url blog_post_url(blog_post, format: :json)

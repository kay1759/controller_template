class CreateBlogPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :blog_posts do |t|
      t.integer :blog_id
      t.string :name
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end

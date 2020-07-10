class BlogPostsController < ResourcesController

  private

    def resource_params
      params.require(:blog_post).permit(:blog_id, :name, :title, :content)
    end
end

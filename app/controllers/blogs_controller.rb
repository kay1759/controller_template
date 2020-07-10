class BlogsController < ResourcesController

  private

    # Only allow a list of trusted parameters through.
    def resource_params
      params.require(:blog).permit(:name, :title, :content)
    end
end

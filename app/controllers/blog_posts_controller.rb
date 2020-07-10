class BlogPostsController < ApplicationController
  before_action :set_blog_post, only: [:show, :edit, :update, :destroy]

  # GET /blog_posts
  # GET /blog_posts.json
  def index
    @resources = BlogPost.all
  end

  # GET /blog_posts/1
  # GET /blog_posts/1.json
  def show
  end

  # GET /blog_posts/new
  def new
    @resource = BlogPost.new
  end

  # GET /blog_posts/1/edit
  def edit
  end

  # POST /blog_posts
  # POST /blog_posts.json
  def create
    @resource = BlogPost.new(resource_params)

    respond_to do |format|
      if @resource.save
        format.html { redirect_to @resource, notice: 'Blog post was successfully created.' }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blog_posts/1
  # PATCH/PUT /blog_posts/1.json
  def update
    respond_to do |format|
      if @resource.update(resource_params)
        format.html { redirect_to @resource, notice: 'Blog post was successfully updated.' }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blog_posts/1
  # DELETE /blog_posts/1.json
  def destroy
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to blog_posts_url, notice: 'Blog post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog_post
      @resource = BlogPost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def resource_params
      params.require(:blog_post).permit(:blog_id, :name, :title, :content)
    end
end

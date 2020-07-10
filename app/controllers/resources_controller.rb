class ResourcesController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # initialize
  def initialize(args = {})
    super()
    @plural = self.controller_name
    @model = find_model(@plural)
    @singular = to_singular(@model)
  end

  # GET /@model
  def index
    #instance_variable_set("@#{@plural}", @model.all)
    @resources = @model.all
  end

  # GET /@model/1
  # GET /posts/1.json
  def show
  end

  # GET /@model/new
  def new
    # instance_variable_set("@#{@singular}", @model.new)
    @resource = @model.new
  end

  # GET /@model/1/edit
  def edit
  end

  # POST /@model
  def create
    #instance_variable_set("@#{@singular}", @model.new(resource_params))
    @resource = @model.new(resource_params)

    respond_to do |format|
      if @resource.save
        format.html { redirect_to @resource, notice: "#{@model} was successfully created." }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
=begin
      if instance_variable_get("@#{@singular}").save
        format.html { redirect_to instance_variable_get("@#{@singular}"), notice: "#{@model} was successfully created." }
        format.json { render :show, status: :created, location: instance_variable_get("@#{@singular}") }
      else
        format.html { render :new }
        format.json { render json: instance_variable_get("@#{@singular}").errors, status: :unprocessable_entity }
      end
=end
    end
  end

  # PATCH/PUT /@model/1
  def update
    respond_to do |format|
      if @resource.update(resource_params)
        format.html { redirect_to @resource, notice: "#{@model} was successfully created." }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
=begin
    respond_to do |format|
      if instance_variable_get("@#{@singular}").update(resource_params)
        format.html { redirect_to instance_variable_get("@#{@singular}"), notice: "#{@model} was successfully updated." }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: instance_variable_get("@#{@singular}").errors, status: :unprocessable_entity }
      end
    end
=end
  end

  # DELETE /@model/1
  def destroy
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to "/#{@plural}", notice: "#{@model} was successfully destroyed." }
      format.json { head :no_content }
    end
=begin
    instance_variable_get("@#{@singular}").destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "#{@model} was successfully destroyed." }
      format.json { head :no_content }
    end
=end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @resource = @model.find(params[:id])
    end

    # find model = corresponding model
    def find_model(plural)
      Kernel.const_get(ActiveSupport::Inflector.classify(plural))
    end

    # find model = corresponding model
    def to_singular(model)
      model.name.underscore
    end
end

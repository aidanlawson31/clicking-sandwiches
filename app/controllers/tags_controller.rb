class TagsController < ApplicationController
  before_action :form_setup, only: [:edit, :index, :create, :destroy]
  before_action :set_tag,    only: [:edit, :update, :destroy]

  def index
    @tags = @business.tags.all
    @tag  = @business.tags.new
  end

  def create
    @tag = @business.tags.new(tag_params)
    
    if @tag.save
      redirect_to business_tags_path(@business), notice: 'tag created successfully'
    end
  end

  def edit
  end

  def update
    if @tag.update(tag_params)
      render file: "tags/update.js.erb"
    else
      render file: "tags/edit.js.erb"
    end
  end

  def destroy
    @tag.destroy
    redirect_to business_tags_path(@business), notice: 'tag created successfully'
  end

  def repopulate_tags
    BusinessInitialize.create_menu_item_tags(params[:id])
    redirect_to business_tags_path(params[:id])
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def form_setup
    @business = Business.find(params[:business_id])
  end

  def tag_params
    params[:tag].permit(:name, :icon)
  end
end 
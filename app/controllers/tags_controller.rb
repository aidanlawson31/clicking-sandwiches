class TagsController < ApplicationController
  before_action :form_setup, only: [:edit, :index, :create, :destroy, :save_sort_tags]
  before_action :set_tag,    only: [:edit, :update, :destroy]
  before_action :current_user_belongs_to_business

  def index
    @tags = @business.tags.all
    @tag  = @business.tags.new
  end

  def create
    @tag = @business.tags.new(tag_params)

    if @tag.save
      @tag.display_sequence_number = next_display_sequence_number
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
    redirect_to business_tags_path(@business), notice: 'tag deleted successfully'
  end

  def repopulate_tags
    BusinessInitialize.create_menu_item_tags(params[:id])
    redirect_to business_tags_path(params[:id])
  end

  def save_sort_tags
    if @business.update(tag_sort_params)
      redirect_to business_tags_path(@business), notice: "Tags successfuly sorted"
    else 
      redirect_to business_tags_path(@business), notice: "Tags failed to be sorted"
    end
  end

  private

  def next_display_sequence_number
    last_tag = @business.tags.last
    last_tag ? (last_tag.display_sequence_number + 1) : 1
  end

  def tag_sort_params
    params[:business].permit(tags_attributes: [:id, :name, :display_sequence_number, :icon])
  end

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

class BusinessesController < ApplicationController
  before_action :authenticate_user!
  before_action :form_setup, only: [:update, :show]

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)

    if @business.save
      current_user.update_attributes(business_id: @business.id)
      redirect_to @business, notice: "Business created successfully"
    else
      render :new
    end
  end

  def update    
    if @business.update(business_params)
      redirect_to business_path(@business), notice: "Business updated successfully"
    else
      render :show 
    end
  end

  def destroy
    @business.destroy
    redirect_to new_business_path, notice: 'Business was successfully destroyed.'
  end

  def show
  end

  private

  def form_setup
    @business                   = current_user.business
    @business_display_attribute = @business.business_display_attribute
    @fonts                      = Font.all
  end

  def business_params
    params[:business].permit(:name, :email, :phone_number, :description, :business_url)
  end
end

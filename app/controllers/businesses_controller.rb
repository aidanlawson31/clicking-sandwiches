class BusinessesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_business, only: [:edit, :update, :destroy]

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

  def edit
  end

  def update
    if @business.update(business_params)
      redirect_to business_path(@business), notice: "Business updated successfully"
    else
      render :edit 
    end
  end

  def destroy
    @business.destroy
    redirect_to new_business_path, notice: 'Business was successfully destroyed.'
  end

  def show
    @business = current_user.business
  end

  private

  def set_business
    @business = Business.find(params[:id])
  end

  def business_params
    params[:business].permit(:name, :email, :phone_number, :business_url)
  end
end

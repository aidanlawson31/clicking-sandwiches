class BusinessesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_business, only: [:edit, :update, :destroy, :add_admins]
  before_action :set_user, only: [:remove_admin_privileges, :grant_admin_privileges, :remove_user]
  
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
      render :show 
    end
  end

  def destroy
    @business.destroy
    redirect_to new_business_path, notice: 'Business was successfully destroyed.'
  end

  def show
    @business                   = current_user.business
    @business_display_attribute = @business.business_display_attribute
    @fonts                      = Font.all
  end

  def access_admins
    @user     = User.new
    @business = current_business
  end

  def create_user
    raise ArgumentError, 'You must be an admin to access this method' unless current_user.admin
    @user             = User.new(user_params)
    @user.business_id = params[:id]

    if @user.save
      redirect_to access_admins_business_path(params[:id])
    else
      redirect_to access_admins_business_path(params[:id])
      flash.now[:notice] == "#{@user.errors.full_messages}"
    end
  end

  def remove_admin_privileges
    raise ArgumentError, 'You must be an admin to access this method' unless current_user.admin
    @user.admin = false

    if @user.save 
      redirect_to access_admins_business_path(params[:id])
    else
      redirect_to access_admins_business_path(params[:id])
      flash.now[:notice] == "#{@user.errors.full_messages}"
    end
  end

  def grant_admin_privileges
    raise ArgumentError, 'You must be an admin to access this method' unless current_user.admin
    @user.admin = true

    if @user.save 
      redirect_to access_admins_business_path(params[:id])
    else
      redirect_to access_admins_business_path(params[:id])
      flash.now[:notice] == "#{@user.errors.full_messages}"
    end
  end

  def remove_user
    raise ArgumentError, 'You must be an admin to access this method' unless current_user.admin
    
    if @user.destroy
      redirect_to access_admins_business_path(params[:id])
    else
      redirect_to access_admins_business_path(params[:id])
      flash.now[:notice] == "#{@user.errors.full_messages}"
    end
  end
  
  private

  def user_params
    params[:user].permit(:admin, :first_name, :last_name, :email, :password, :password_confirmation)
  end

  def set_user 
    @user = User.find(params[:id])
  end

  def set_business
    @business = Business.find(params[:id])
    @business_display_attribute = @business.business_display_attribute
  end

  def business_params
    params[:business].permit(:name, :email, :phone_number, :description, :business_url)
  end
end

class BusinessUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:remove_admin_privileges, :grant_admin_privileges, :destroy]
  before_action :set_business

  def index
    @user = User.new
  end

  def create
    raise ArgumentError, 'You must be an admin to access this method' unless current_user.admin
    @user             = User.new(user_params)
    @user.business_id = @business.id

    if @user.save
      redirect_to business_business_users_path(@business)
    else
      redirect_to business_business_users_path(@business)
      flash.now[:notice] == "#{@user.errors.full_messages.join(', ')}"
    end
  end

  def destroy
    raise ArgumentError, 'You must be an admin to access this method' unless current_user.admin

    if @user.destroy
      redirect_to business_business_users_path(@business)
    else
      redirect_to business_business_users_path(@business)
      flash.now[:notice] == "#{@user.errors.full_messages.join(', ')}"
    end
  end

  def remove_admin_privileges
    raise ArgumentError, 'You must be an admin to access this method'    unless current_user.admin

    @user.admin = false

    if @user.save 
      redirect_to business_business_users_path(@business)
    else
      redirect_to business_business_users_path(@business)
      flash.now[:notice] == "#{@user.errors.full_messages.join(', ')}"
    end
  end

  def grant_admin_privileges
    raise ArgumentError, 'You must be an admin to access this method' unless current_user.admin
    @user.admin = true

    if @user.save 
      redirect_to business_business_users_path(@business)
    else
      redirect_to business_business_users_path(@business)
      flash.now[:notice] == "#{@user.errors.full_messages.join(', ')}"
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
    @business = current_business
  end
end

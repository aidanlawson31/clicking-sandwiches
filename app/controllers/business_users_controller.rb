class BusinessUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:remove_admin_privileges, :grant_admin_privileges, :destroy]
  before_action :set_business
  before_action :must_be_admin, only: [:create, :destroy, :remove_admin_privileges, :grant_admin_privileges]

  def index
    @user = User.new
  end

  def create
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
    if @user.destroy
      redirect_to business_business_users_path(@business)
    else
      redirect_to business_business_users_path(@business)
      flash.now[:notice] == "#{@user.errors.full_messages.join(', ')}"
    end
  end

  def remove_admin_privileges
    @user.admin = false

    if @user.save 
      redirect_to business_business_users_path(@business)
    else
      redirect_to business_business_users_path(@business)
      flash.now[:notice] == "#{@user.errors.full_messages.join(', ')}"
    end
  end

  def grant_admin_privileges
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

  def must_be_admin
    unless current_user.admin?
      render 'shared/not_authorized', layout: false, status: :unauthorized
    end
  end
end

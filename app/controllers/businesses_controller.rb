class BusinessesController < ApplicationController
  def index
    @businesses = Business.all
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)

    if @business.save
      redirect_to @business, notice: "Business created successfully"
    else
      puts "ALALAL #{error.full_messages}"
    end
  end

  def show
    @business = Business.find(params[:id])
  end
end

class PhonesController < ApplicationController
  before_action :set_phone, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @phones = Phone.all
    respond_with(@phones)
  end

  def show
    respond_with(@phone)
  end

  def new
    @phone = Phone.new
    respond_with(@phone)
  end

  def edit
  end

  def create
    @phone = Phone.new(phone_params)
    @phone.save
    respond_with(@phone)
  end

  def update
    @phone.update(phone_params)
    respond_with(@phone)
  end

  def destroy
    @phone.destroy
    respond_with(@phone)
  end

  private
    def set_phone
      @phone = Phone.find(params[:id])
    end

    def phone_params
      params.require(:phone).permit(:name, :contry, :number)
    end
end

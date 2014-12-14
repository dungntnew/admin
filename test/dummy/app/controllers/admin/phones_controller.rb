class Admin::PhonesController < Admin::ApplicationController
  before_action :set_phone, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  authorize_actions_for Phone, :except => :index

  # GET /admin/phones
  def index
    @phones = Phone.all
  end

  # GET /admin/phones/1
  def show
  end

  # GET /admin/phones/new
  def new
    @phone = Phone.new
  end

  # GET /admin/phones/1/edit
  def edit
  end

  # POST /admin/phones
  def create
    @phone = Phone.new(phone_params)

    if @phone.save
      redirect_to main_app.admin_phones_url, notice: 'Phone was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/phones/1
  def update
    if @phone.update(phone_params)
      redirect_to main_app.admin_phones_url, notice: 'Phone was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/phones/1
  def destroy
    @phone.destroy
    redirect_to main_app.admin_phones_url, notice: 'Phone was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phone
      @phone = Phone.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def phone_params
      params.require(:phone).permit([:name, :contry, :number])
    end
end

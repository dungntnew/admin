class Admin::ItemsController < Admin::ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  authorize_actions_for Item, :except => :index

  # GET /admin/items
  def index
    @items = Item.all
  end

  # GET /admin/items/1
  def show
  end

  # GET /admin/items/new
  def new
    @item = Item.new
  end

  # GET /admin/items/1/edit
  def edit
  end

  # POST /admin/items
  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to main_app.admin_items_url, notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/items/1
  def update
    if @item.update(item_params)
      redirect_to main_app.admin_items_url, notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/items/1
  def destroy
    @item.destroy
    redirect_to main_app.admin_items_url, notice: 'Item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_params
      params.require(:item).permit([:name, :description, :price])
    end
end

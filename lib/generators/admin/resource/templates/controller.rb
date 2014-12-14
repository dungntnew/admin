class Admin::<%=controller_class_name%>Controller < Admin::ApplicationController
  before_action :set_<%=model_name%>, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  authorize_actions_for <%=model_class%>, :except => :index

  # GET /<%=name_for_route%>
  def index
    @<%=model_name_plural%> = <%=model_class%>.all
  end

  # GET /<%=name_for_route%>/1
  def show
  end

  # GET /<%=name_for_route%>/new
  def new
    @<%=model_name%> = <%=model_class%>.new
  end

  # GET /<%=name_for_route%>/1/edit
  def edit
  end

  # POST /<%=name_for_route%>
  def create
    @<%=model_name%> = <%=model_class%>.new(<%=model_name%>_params)

    if @<%=model_name%>.save
      redirect_to <%=index_url%>, notice: '<%=model_class%> was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /<%=name_for_route%>/1
  def update
    if @<%=model_name%>.update(<%=model_name%>_params)
      redirect_to <%=index_url%>, notice: '<%=model_class%> was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /<%=name_for_route%>/1
  def destroy
    @<%=model_name%>.destroy
    redirect_to <%=index_url%>, notice: '<%=model_class%> was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_<%=model_name%>
      @<%=model_name%> = <%=model_class%>.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def <%=model_name%>_params
      params.require(:<%=model_name%>).permit(<%= attributes.map{ |e| e.to_sym }.to_s %>)
    end
end

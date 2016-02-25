class PricesController < ApplicationController
  before_action :set_price, only: [:show, :edit, :update, :destroy]
  before_filter :require_permission, only: [:create, :new, :edit, :update, :destroy, :advanced_edit]


  def require_permission
    if current_user.control.to_i == 0
      return true
    end
    @salon = Salon.find_by_permalink(params[:id])
    if @salon
      id = @salon.id
    else
      if @price
        id = @price.salon.id
      end
    end
    if current_user.control.to_i == id or current_user.control.to_i == 0
      return true
    else
      redirect_to root_path
    end
  end

  # GET /prices
  # GET /prices.json
  def index
    @prices = Price.all
  end

  # GET /prices/1
  # GET /prices/1.json
  def show
    @test = 'test'
  end

  # GET /prices/new
  def new
    @price = Price.new
  end

  def advanced_edit
    @salon = Salon.find_by_permalink(params[:id])
    @prices = Price.where("salon_id = ?", @salon.id)
  end

  # GET /prices/1/edit
  def edit
  end

  # HELPER FUNCTION
  def update_services(price)
    current_service_id = price.service.id
    prices = Price.where(:service_id => current_service_id).count
    service_to_update = Service.find(current_service_id)
    service_to_update.update(:counter => prices)
  end

  # POST /prices
  # POST /prices.json
  def create
    @price = Price.new(price_params)

    respond_to do |format|
      if @price.save
        update_services(@price)
        format.html { redirect_to :back, notice: '<b>' + @price.service.name + '</b> was successfully created.'}
        format.json { render :show, status: :created, location: @price }
      else
        format.html { render :back }
        format.json { render json: @price.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prices/1
  # PATCH/PUT /prices/1.json
  def update
    respond_to do |format|
      if @price.update(price_params)
        format.html { redirect_to :back, notice: '<b>' + @price.service.name + '</b> was successfully updated.'}
        format.json { render :show, status: :ok, location: @price }
      else
        format.html { render :back }
        format.json { render json: @price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prices/1
  # DELETE /prices/1.json
  def destroy
    @price.destroy
    update_services(@price)
    respond_to do |format|
      format.html { redirect_to :back, notice: '<b>' + @price.service.name + '</b> was successfully destroyed.'}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_price
      @price = Price.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def price_params
      params.require(:price).permit(:price, :salon_id, :service_id)
    end
end

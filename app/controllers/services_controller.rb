class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
    before_filter :super_admin_permissions, only: [:update, :edit, :show, :index, :new, :create,:destroy]

  # GET /services
  # GET /services.json
  def index
    @services = Service.all
  end

  # GET /services/1
  # GET /services/1.json
  def show

    @target = { :lng => cookies[:lng].to_f, :lat => cookies[:lat].to_f}

    @services = Service.find_by(slug: params[:id]).salons.joins(:prices).distinct
    @salons = @services.reorder("prices.price #{params[:sort] == 'skuplji' ? 'DESC' : 'ASC'}")

    if params[:sort] == 'blizi' or params[:sort] == 'dalji'
      @salons = @services.sort { |l,r| l.distance_to(@target) <=> r.distance_to(@target) }
    end

    if params[:sort] == 'dalji'
      @salons = @salons.reverse
    end

    @number_of_results = @salons.count
    @salons = @salons.paginate(:page => params[:strana])



  end

  # GET /services/new
  def new
    @service = Service.new
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)

    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params.except(:counter))
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy

    # remove prices on service remove
    prices = Price.where(:service_id => @service.id)
    prices.each do |price|
      price.destroy
    end

    @service.destroy
    
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find_by_slug(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:name, :slug, :counter)
    end
end

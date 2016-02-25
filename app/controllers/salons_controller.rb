class SalonsController < ApplicationController
  before_action :set_salon, only: [:show, :edit, :update, :destroy]
  before_filter :super_admin_permissions, only: [:new, :create,:destroy]
  before_filter :require_permission, only: [:edit, :update]


  def require_permission
    if current_user.control.to_i == 0
      return true
    end
    if @salon
      id = @salon.id
      if current_user.control.to_i == id or current_user.control.to_i == 0
        return true
      else
        flash[:alert] = t("no_right_to_do_that")
        redirect_to root_path
      end
    else
      flash[:alert] = t("no_right_to_do_that")
      redirect_to root_path
    end
  end

  def search
    @target = { :lng => cookies[:lng].to_f, :lat => cookies[:lat].to_f}
    @salons = Salon.all
    if params[:search]
      @salons = Salon.search(params[:search]).order("created_at DESC")
      if params[:sort]=='dalji'
        @salons = @salons.sort { |l,r| l.distance_to(@target) <=> r.distance_to(@target) }.reverse
      else
        @salons = @salons.sort { |l,r| l.distance_to(@target) <=> r.distance_to(@target) }
      end
    else
      @salons = Salon.all.order('created_at DESC')
    end
    @number_of_results = @salons.count
    @salons = @salons.paginate(:page => params[:strana])
  end

  def index
    @target = { :lng => cookies[:lng].to_f, :lat => cookies[:lat].to_f}

    if cookies[:lng] and cookies[:lat]
      @salons = Salon.all.sort { |l,r| l.distance_to(@target) <=> r.distance_to(@target) }
      if params[:sort]=="dalji"
        @salons = @salons.reverse
      end
    else
      @salons = Salon.all.order('updated_at DESC')
    end


    @number_of_results = @salons.count
    @salons = @salons.paginate(:page => params[:strana])
  end

  # GET /salons/1
  # GET /salons/1.json
  def show
  end

  # GET /salons/new
  def new
    @salon = Salon.new
  end

  # GET /salons/1/edit
  def edit
  end

  # POST /salons
  # POST /salons.json
  def create
    @salon = Salon.new(salon_params)
    respond_to do |format|
      if @salon.save
        format.html { redirect_to @salon, notice: 'Salon was successfully created.' }
        format.json { render :show, status: :created, location: @salon }
      else
        format.html { render :new }
        format.json { render json: @salon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /salons/1
  # PATCH/PUT /salons/1.json
  def update
    respond_to do |format|
      id = @salon.id
      if current_user.control.to_i == id
        params = salon_params.except(:name, :permalink)
      end
      if current_user.control.to_i == 0
        params = salon_params
      end

      if @salon.update(params)
        format.html { redirect_to @salon, notice: 'Salon was successfully updated.' }
        format.json { render :show, status: :ok, location: @salon }
      else
        format.html { render :edit }
        format.json { render json: @salon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salons/1
  # DELETE /salons/1.json
  def destroy
    @salon.prices.each do |price|
      price.destroy
    end
    @salon.destroy
    respond_to do |format|
      format.html { redirect_to salons_url, notice: 'Salon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_salon
      @salon = Salon.find_by_permalink(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def salon_params
      params.require(:salon).permit(
        :name,
        :address,
        :description,
        :lat, :lng,
        :permalink,
        :image,
        :phone1, :phone2,
        :email, :website,
        :facebook, :twitter, :instagram,
        :city_name, :municipality_name,
        :monday,
        :thusday,
        :wednesdey,
        :thursday,
        :friday,
        :saturday,
        :sunday)
    end
end

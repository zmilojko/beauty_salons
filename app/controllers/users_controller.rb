class UsersController < ApplicationController
  before_filter :super_admin_permissions, only: [:list, :new_custom, :create_custom]

  def list
    @users = User.all
  end

  def new_custom
    @user = User.new
  end

  def create_custom
    @user = User.new(user_params)
    if user_params[:password_confirmation] != user_params[:password]
      flash[:alert] = "Passwords don't match."
      redirect_to :back
    else
      respond_to do |format|
        if @user.save
          format.html { redirect_to root_path, notice: 'User was successfully created.' }
          format.json { render :show, status: :created, location: root_path }
        else
          format.html { render :new }
          format.json { render json: @service.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def delete_custom
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params.except(:control))
        format.html { redirect_to @user, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :control, :password, :password_confirmation)
    end


end

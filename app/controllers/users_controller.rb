class UsersController < ApplicationController
  def list
    if current_user.control.to_i == 0
      @users = User.all
    else
      redirect_to '/'
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


end

# frozen_string_literal: true

class UsersController < ApplicationController
  
    # GET /resource/sign_up
    def new
    end
  
    # POST /resource
    def create
    end
  
    # GET /resource/edit
    def edit
    end
  
    def update
    #   binding.break
      if @user.update(user_params)
        redirect_to user_url(@user), notice: 'User was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
  end
  
    protected
  
    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :surename)
    end

  end
  
# frozen_string_literal: true

# Users controller
class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    if current_user.id == params[:id].to_i
      @user = User.find(params[:id])
    else
      redirect_to(root_path, notice: "User isn't correct")
    end
  end
end

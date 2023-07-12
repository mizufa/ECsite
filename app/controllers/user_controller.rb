class UserController < ApplicationController
  def show
    @user = Customer.find(params[:id])
  end

  def edit
  end
end

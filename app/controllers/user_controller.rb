class UserController < ApplicationController
  def show
    @user = Customer.find(params[:id])
  end

  def edit
    @user = Customer.find(params[:id])
  end
end

  def update
    user = Customer.find(params[:id])
    user.update(customer_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(current_customer.id) #ユーザーの投稿一覧ページへリダイレクト。
  end


  private
  def customer_params
    params.require(:customers).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
  end
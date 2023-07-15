class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    flash[:notice] = "You have updated customer successfully."
    redirect_to customer_path(current_customer) #ユーザーの投稿一覧ページへリダイレクト。
  end

  def unsubscribe #退会確認画面用
  end

  def withdraw #退会処理用
    @customer = Customer.find(params[:id])
    if @customer.is_deleted == false #退会ステータスがfalse(未退会)の場合
      @customer.update(is_deleted: true)
      reset_session
      flash[:notice] = "退会処理を実行いたしました"
      redirect_to root_path
    else
      redirect_to new_customer_registration_path #サインアップ画面へリダイレクト
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
  end
end

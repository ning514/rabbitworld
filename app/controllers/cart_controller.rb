class ::CartController < ApplicationController
  def index

  end

  def show_data
    @data = ::Cart.find_by_sql(["
      select t1.*, t2.id prod_id, t2.name prod_name, t2.price prod_price, t2.desc prod_desc
      from carts t1
      inner join products t2 on t1.product_id = t2.id
      where t1.user_id = ? ", session[:user]["userid"] ])
    render layout: false
  end

  def update
    if ::Cart.find(params[:id]).update(qty: params[:qty])
      render json: {sucess: true}
    else
      render json: {sucess: false}
    end
  end

  def check_out
  end

  def destroy
    ::Cart.find(params[:id]).destroy
    redirect_to action: :index
  end
end
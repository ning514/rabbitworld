class ::Shop::CustomerController < ApplicationController
  def index
    @category_list = Constant::CATEGORY
  end

  def search
    if params[:search_key].present?
      @data = ::Product.where("name like '%#{params[:search_key]}%'")
    elsif params[:category].present?
      @data = ::Product.where("category = ?", params[:category])
    else
      @data = ::Product.order("RANDOM()").take(10) # 隨機排序取10筆
    end
    render layout: false
  end

  def add_to_cart
    if session[:user].present?
      userid = session[:user]["userid"]
      data = ::Cart.where("user_id = ? and product_id = ?", userid, params[:prod_id]).first
      if data.present?
        qty = data.qty.to_i + 1
        data.update(qty: qty)
      else
        ::Cart.create({product_id: params[:prod_id], qty: 1, user_id: userid})
      end
      render json: {success: true}
    else
      render json: {success: false}
    end
  end
end
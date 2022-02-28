class ::CartController < ApplicationController
  before_action :get_data, only: [:show_data, :check_out]
  def index

  end

  def show_data
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
    @user = User.find(session[:user]["userid"])
  end

  def confirm
    ActiveRecord::Base.transaction do
      @attrs = params[:check_out]
      cart_data = ::Cart.where("user_id = ?", session[:user]["userid"])
      cur_id = ::Orderlist.last.id rescue 0

      head = ::Orderlist.create({
        order_num: Time.now.strftime("%Y%m%d") + (cur_id.to_i + 1).to_s,
        user_id: session[:user]["userid"],
        buy_date: Time.now.strftime('%Y/%m/%d'),
        buy_name: @attrs[:name],
        buy_email: @attrs[:email],
        buy_address: @attrs[:address],
        buy_tel: @attrs[:telephone],
        amount: @attrs[:ttl]
      })

      cart_data.each do |d|
        ::OrderlistDtl.create({
          list_id: head.id,
          prod_id: d.product_id,
          qty: d.qty
        })
      end

      cart_data.destroy_all
      redirect_to action: :result, result: 'Y', order_num: head.order_num
    rescue => e
      puts "===#{e.inspect}"
      redirect_to action: :result, result: 'N'
    end
  end

  def destroy
    ::Cart.find(params[:id]).destroy
    redirect_to action: :index
  end

  def result
    @result = params[:result]
    @order_num = params[:order_num]
  end

  def get_data
    @data = ::Cart.find_by_sql(["
      select t1.*, t2.id prod_id, t2.name prod_name, t2.price prod_price, t2.desc prod_desc
      from carts t1
      inner join products t2 on t1.product_id = t2.id
      where t1.user_id = ?
      order by t1.id", session[:user]["userid"] ])
  end
end
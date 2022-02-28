class UserSys::OrderlistController < ApplicationController
  def index
    @list = Orderlist.where("user_id = ?", session[:user]["userid"]).order("created_at desc")
  end
end

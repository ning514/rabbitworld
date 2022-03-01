class UserSys::AccountController < ApplicationController
  def index
    @data = ::User.find(session[:user]["userid"])
  end

  def update_name
    if ::User.find(session[:user]["userid"]).update(username: params[:name])
      render json: {success: true}
    else
      render json: {success: false}
    end
  end
end

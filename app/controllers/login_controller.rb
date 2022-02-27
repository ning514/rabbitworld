class LoginController < ApplicationController
  def index
  end

  def login
    user = ::User.where("email= ? and psw =?", params[:login][:email], params[:login][:psw]).first
    if user.present?
      session[:user] = {}
      session[:user][:username] = user.username
      session[:user][:userid] = user.id
      redirect_to controller: :main, action: :index
    else
      flash[:danger] = '登入失敗'
      redirect_to action: :index
    end
  end

  def new
  end

  def create
    user = ::User.find_by_email(params[:new_acc][:email])
    if user.present?
      flash[:danger] = '此Email已註冊'
      redirect_to action: :new
    else
      result = ::User.create({
        username: params[:new_acc][:username],
        email: params[:new_acc][:email],
        psw: params[:new_acc][:psw]
      })

      if result.present?
        flash[:success] = '註冊成功'
        redirect_to action: :index
      else
        flash[:danger] = '註冊失敗'
        redirect_to action: :new
      end
    end
  end

  def logout
    session[:user] = nil
    redirect_to controller: :main, action: :index
  end
end
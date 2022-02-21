class LoginController < ApplicationController
    def index
    end

    def login
    end

    def new
    end

    def create
        ::User.create({
            username: params[:new_acc][:username],
            email: params[:new_acc][:email],
            psw: params[:new_acc][:psw]
        })
    end
end
  
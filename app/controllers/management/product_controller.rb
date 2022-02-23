class Management::ProductController < ApplicationController
  before_action :init_option, only: [:index]
  def index
    
  end

  def create

  end

  def init_option
    @category_list = [['牧草', 'GRASS_HAY'], ['飼料', 'PET_FOOD'], ['點心', 'SNACK'], ['玩具', 'TOY'], ['其他', 'OTHER']]
  end
end  
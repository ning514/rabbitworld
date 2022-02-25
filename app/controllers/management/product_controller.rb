class Management::ProductController < ApplicationController
  before_action :init_option, only: [:index, :new]
  def index

  end

  def search
    @attrs = params[:query]
    sql = "1=1"
    sql += " and category = '#{@attrs[:category]}'" if @attrs[:category].present?
    sql += " and name like '%#{@attrs[:name]}%'" if @attrs[:name].present?
    sql += " and price between #{@attrs[:start_price]} and #{@attrs[:end_price]}" if @attrs[:start_price].present? && @attrs[:end_price].present?
    sql += " and ttl_qty between #{@attrs[:start_ttl_qty]} and #{@attrs[:end_ttl_qty]}" if @attrs[:start_ttl_qty].present? && @attrs[:end_ttl_qty].present?
    sql += " and active = '#{@attrs[:active]}'" if @attrs[:active].present?
    sql += " and desc like '%#{@attrs[:desc]}%'" if @attrs[:desc].present?

    @data = ::Product.where(sql)
    render layout: false
  end

  def new
  end

  def create
    result = ::Product.create({
      category: params[:new][:category],
      name: params[:new][:name],
      ttl_qty: params[:new][:ttl_qty],
      price: params[:new][:price],
      unit: params[:new][:unit],
      unit_qty: params[:new][:unit_qty],
      desc: params[:new][:desc]
    })

    if result.present?
      flash[:success] = '建立成功'
      redirect_to action: :index
    else
      flash[:danger] = '建立失敗'
      redirect_to action: :new
    end
  end

  def edit
  end

  def init_option
    @category_list = [['牧草', 'GRASS_HAY'], ['飼料', 'PET_FOOD'], ['點心', 'SNACK'], ['玩具', 'TOY'], ['其他', 'OTHER']]
    @unit_list = ["公克", "公斤"]
    @active_list = [["上架", "Y"], ["下架", "N"]]
  end
end
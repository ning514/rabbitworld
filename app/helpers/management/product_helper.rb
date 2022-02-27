module ::Management::ProductHelper
  def self.product_category(category)
    case category
    when 'GRASS_HAY'
      return '牧草'
    when 'PET_FOOD'
      return '飼料'
    when 'SNACK'
      return '點心'
    when 'TOY'
      return '玩具'
    when 'OTHER'
      return '其他'
    end
  end
end
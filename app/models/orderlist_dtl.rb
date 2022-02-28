class OrderlistDtl < ApplicationRecord
  belongs_to :product, class_name: 'Product', foreign_key: 'prod_id'
end

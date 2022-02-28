class Orderlist < ApplicationRecord
  has_many :dtl, class_name: 'OrderlistDtl', foreign_key: 'list_id'
end

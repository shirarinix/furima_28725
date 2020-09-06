class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  belongs_to_active_hash :product
  belongs_to_active_hash :delivery
  belongs_to_active_hash :preparation

  belongs_to :user
  has_one :purchas
  has_one_attached :image

  # ジャンルの選択が「--」の時は保存できないようにする
  validates :delivery_id, :product_id, :category_id, :prefecture_id, :preparation_id, numericality: { other_than: 0 }
  # 空の投稿を保存できないようにする
  validates :image, :name, :introduction, :selling_price, presence: true
  validates :selling_price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end

class Item < ApplicationRecord
  belongs_to :user
  has_one :purchas
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  belongs_to_active_hash :product
  belongs_to_active_hash :delivery
  belongs_to_active_hash :preparation

  # 空の投稿を保存できないようにする
  validates :image, :name, :introduction, :category, :product,
            :delivery, :prefecture, :preparation, :selling_price, presence: true
  # ジャンルの選択が「--」の時は保存できないようにする
  validates :delivery_id, :product_id, :category_id, :prefecture_id, numericality: { other_than: 0 }
end

class Item < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_one :purchas

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  belongs_to_active_hash :product

  # 空の投稿を保存できないようにする
  validates :image, :name, :introduction, :selling_price, presence: true
  validates :product, :category, :prefecture, presence: true

  # ジャンルの選択が「--」の時は保存できないようにする
  validates :product_id, :category_id, :prefecture_id, numericality: { other_than: 0 }
end

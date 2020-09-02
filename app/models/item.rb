class Item < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_one :purchas

  validates :image, :name, :introduction, :selling_price, presence: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  #空の投稿を保存できないようにする
  validates :prefecture, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :prefecture_id, numericality: { other_than: 0 }
end

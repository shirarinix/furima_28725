class Item < ApplicationRecord
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :item

  # #空の投稿を保存できないようにする
  # validates :item, presence: true

  # #ジャンルの選択が「--」の時は保存できないようにする
  # validates :prefecture_id, numericality: { other_than: 0 }
end

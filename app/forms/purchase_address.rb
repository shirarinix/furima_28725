class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number

  with_options presence: true do
    validates :token
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :building_name
    validates :phone_number, format: { with: /\A\d{11}\z/, message: "can't be blank" }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(token: token, post_code: post_code, prefecture_id: prefecture_id, city: city, address: address,
                   building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end
